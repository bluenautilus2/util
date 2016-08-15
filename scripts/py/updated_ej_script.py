from cassandra.cluster import Cluster
from cassandra.query import dict_factory
import sys;

reload(sys);
sys.setdefaultencoding("utf8")

# DEVELOPER CONFIGURATIONS
IPADDRESS = ['127.0.0.1']	# Local Dev Environments can use this address or set variable to []
PORT = 9042

ALTERED_TABLES = {
	'admin_right_sets': ['name_lower'],
	'area_codes': ['area_code_lower'],
	'default_system_configuration_properties': ['name_lower'],
	'portal_code_companies': ['portal_code_lower'],
	'postal_codes_usa': ['city_state_name_lower', 'county_lower', 'county_is_null', 'postal_code_lower', 'state_abbreviation_lower'],
	'server_specific_system_configuration_properties': ['server_name_lower', 'name_lower'],
	'strategic_leadership_job_templates': ['name_lower'],
	'text_resources': ['company_id_is_null'],
	'text_site_help': ['code_lower']
}
CASE_INSENSITIVE_SUFFIX_LENGTH = 6
INSERT_STATEMENT = 'INSERT INTO '
IS_NULL_SUFFIX_LENGTH = 8
GLOBAL_KEYSPACE = 'global.'
REGIONAL_KEYSPACE = 'pa.'
SELECT_STATEMENT = 'SELECT * FROM '
TABLES_BEING_MIGRATED = {
	'default_system_configuration_properties': [REGIONAL_KEYSPACE, 'default_system_configuration_properties_1'], 'server_specific_system_configuration_properties': [REGIONAL_KEYSPACE, 'server_specific_system_configuration_property_1']
}

# Change IP in Cluster constructor, if necessary
# For example, Cassandra CI would be 'cluster = Cluster(['127.0.0.1'])'
cluster = Cluster(IPADDRESS, PORT)
session = cluster.connect()
session.row_factory = dict_factory

'''
	Handler for tables that have been altered with additional case insensitive columns
'''
def handleCaseInsensitiveColumn(column, columnString, table, value, valueList):
	if column + '_is_null' not in ALTERED_TABLES[table]:
		valueList.append(value)
	if value == None:
		valueList.append('0')
	else:
		valueList.append(value.lower())
	return columnString + column + '_lower, '

'''
	Handler for tables that have been altered with additional nullable columns
'''
def handleNullableColumn(column, columnString, table, value, valueList):
	valueList.append('0' if value == None else value)
	valueList.append(True if value == None else False)
	return columnString + column + '_is_null, '

'''
	Handler for tables that have been altered with additional nullable or case insensitive columns
'''
def handleAlteredTable(column, columnString, table, value, valueList):
	columnString = column + ', '
	if column + '_is_null' in ALTERED_TABLES[table]:
		columnString = handleNullableColumn(column, columnString, table, value, valueList)
	if column + '_lower' in ALTERED_TABLES[table]:
		columnString = handleCaseInsensitiveColumn(column, columnString, table, value, valueList)

	return columnString

'''
	Test of the population method. Checks row counts from origin to all destinations.
	If the row counts are off, please contact EJ and Mark.
'''
def validityCheck():
	print 'Now Commencing Validity Check...'
	for table, dupList in TABLES_BEING_MIGRATED.items():
		row = session.execute('select count(*) from ' + REGIONAL_KEYSPACE + table)
		correctCount = row[0].values()
		print '\033[92m' + table + '\t\t\t' + str(correctCount)

		index = 0
		for item in dupList:
			if index > 0:
				row = session.execute('select count(*) from ' + dupList[0] + dupList[index])
				if row[0].values() != correctCount:
					print '\033[91m' + 'Error: table data out of sync! Notify EJ and Mark!'
				print dupList[index] + '\t\t\t' + str(row[0].values())
			index += 1

'''
	This method is for testing purposes only. Will truncate all migrated tables.
'''
def truncateAll():
	print 'Now Commencing Data Cleanup...'
	for table, dupList in TABLES_BEING_MIGRATED.items():
		index = 0
		for item in dupList:
			if index > 0:	
				truncateStatement = 'TRUNCATE ' + dupList[0] + dupList[index]
				session.execute(truncateStatement)
				print truncateStatement
			index += 1	

'''
	Populates all migrated tables with data from the original Regional table. If a row fails to be migrated,
	migration of the table being processed will be halted. Method will print row that has failed, the cassandra 
	exception, halt processing of the table, then proceed to the next table.
'''
def populateAll():
	# Iterate through tables being selected for migration
	for table, resultList in TABLES_BEING_MIGRATED.items():
		print table + ' is now being migrated from Regional to ' + resultList[0][:-1]
		if table == 'postal_codes_usa':
			print 'This is a high volume table, please be patient.'
		isTableBeingAltered = table in ALTERED_TABLES.keys()
		rows = session.execute(SELECT_STATEMENT + REGIONAL_KEYSPACE + table + ';')

		# Iterate through result set to build insert statement
		for row in rows:
			try:
				columnString = ''
				insertEnd = ''
				valueList = []

				# Iterate through key, value pairs
				counter = 0
				for k, v in row.items():
					counter += 1
					if (isTableBeingAltered and v == None and k + '_is_null' in ALTERED_TABLES[table]) or (isTableBeingAltered and k + '_lower' in ALTERED_TABLES[table]):
						valueCount = len(valueList)
						columnString += handleAlteredTable(k, columnString, table, v, valueList)
						valueCount = len(valueList) - valueCount
						insertEnd += '%s, ' * valueCount
					elif v != None:
						columnString += k + ', '
						valueList.append(v)
						insertEnd += '%s, '	

				# Iterate through table duplicates
				index = 0
				for duplicate in resultList:
					if index > 0:
						insertBegin = INSERT_STATEMENT + resultList[0] + duplicate + ' (' + columnString[:-2] + ') VALUES ('
						insertEnd =  insertEnd[:-2] + ')' if insertEnd.endswith(', ') else insertEnd[:-1] + ')'
						session.execute(insertBegin + insertEnd, valueList)
					index += 1
			except Exception as e:
				print 'ERROR: Halting on row: ' + str(row)
				print 'ERROR: ' + str(e)
				print 'ERROR: Invalid insert. Halting migration for: ' + table
				break

# For Test Use:
# truncateAll()

populateAll()
validityCheck()

session.execute("INSERT INTO pa.cql_script_executions (year, tag, last_date_applied) VALUES (2016, 'regional-migration-DEV.py', DATEOF(NOW()))")
session.execute("INSERT INTO global.cql_script_executions (year, tag, last_date_applied) VALUES (2016, 'regional-migration-DEV.py', DATEOF(NOW()))")

session.shutdown()
