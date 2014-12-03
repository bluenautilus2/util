--
-- 2014-11-06_1414612262_DEVELOPER_ONLY.cql  - DEVELOPER ONLY SCRIPT
-- PA-25328
-- Mez Gebreyes
-- DML
-- Pre-Deployment
--
-- The host address property. Server specific configuration.
--
-- SQLRUNNER:NO_RUN
-- DEVELOPER ONLY SCRIPT

-- Please update the server name before running this script.
-- The server name should be the same as the one you have in your local server.xml configuration.
-- The defalut hostname is localhost. Update the value according to your machine's configuration(hosts file), if you are using a different hostname.


-- USE pa; -- Uncomment this line before running the script.

-- Default value - localhost
--INSERT INTO server_specific_system_configuration_properties ( name,  value,  description,  server_name,  categories,  created_by,  created_date,  last_updated_by,  last_updated_date)
--VALUES ('hostAddress', 'localhost', 'Server host address', [REPLACE_THIS_WITH_YOUR_SERVER_NAME],null,'29769918',DATEOF(NOW()), '29769918', DATEOF(NOW()));
