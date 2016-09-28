--
-- 2014-10-02_14111607921_DEVELOPER_ONLY.cql  - DEVELOPER ONLY SCRIPT
-- PA-XXXXX                                   - DEVELOPER ONLY SCRIPT
-- Michael Raquet                             - DEVELOPER ONLY SCRIPT
-- DDL                                        - DEVELOPER ONLY SCRIPT
-- Pre-Deployment                             - DEVELOPER ONLY SCRIPT
--
-- Contains the necessary system properties to start 1.0
--
-- SQLRUNNER:NO_RUN
-- DEVELOPER ONLY SCRIPT


----------------------------------------------------------
--   BEGIN COMMON USER SPECIFIC CONFIGURATION SECTION   --
--                                                      --
-- Replace all %CHANGE_ME% placeholders with your       --
-- environment specific settings.  Once complete,       --
-- uncomment the 'USE pa' statement to fix the script   --
-- to allow for successful execution.                   --
----------------------------------------------------------

USE pa;

TRUNCATE pods;

INSERT INTO pods (pod_number, architecture1_port, architecture1_sub_domain, architecture1_remote_call_subdomain, architecture1_tls_port, architecture2_port, architecture2_sub_domain, architecture2_tls_port, created_by, created_date, last_updated_by, last_updated_date, web_services_sub_domain, webservices_port) 
VALUES (1,80,'devmint', 'devmint',443,80,'devbasil',443,'3',1409467201983,'18214998',1411410282265,'',8444);

INSERT INTO pods (pod_number, architecture1_port, architecture1_sub_domain, architecture1_remote_call_subdomain, architecture1_tls_port, architecture2_port, architecture2_sub_domain, architecture2_tls_port, created_by, created_date, last_updated_by, last_updated_date, web_services_sub_domain, webservices_port) 
VALUES (2,80,'devbasalt', 'devbasalt',443,80,'devshale',443,'3',1409467201983,'18214998',1411410282265,'',8444);

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('siteBaseDomain', 'peopleanswers.com', 'site base domain (typically localhost in development or peopleanswers.com in production)', 1, '18214998', DATEOF(NOW()),
        '18214998', DATEOF(NOW()));

INSERT INTO server_specific_system_configuration_properties (
	server_name,
	name,
	value,
	sensitivity,
	created_by,
	created_date,
	last_updated_by,
	last_updated_date
)
VALUES (
	'devmint',
	'databaseURLPodMain',
	'jdbc:sqlserver://192.168.50.51:1433;DatabaseName=Beth_Pod_Main_1',
	1, -- sensitivity level "protected"
	'12345678',
	DATEOF(NOW()),
	'12345678',
	DATEOF(NOW())
);

INSERT INTO server_specific_system_configuration_properties (
	server_name,
	name,
	value,
	sensitivity,
	created_by,
	created_date,
	last_updated_by,
	last_updated_date
)
VALUES (
	'devbasalt',
	'databaseURLPodMain',
	'jdbc:sqlserver://192.168.50.51:1433;DatabaseName=Beth_Pod_Main_2',
	1, -- sensitivity level "protected"
	'12345678',
	DATEOF(NOW()),
	'12345678',
	DATEOF(NOW())
);

-- set Pod Main Database User for each pod
INSERT INTO server_specific_system_configuration_properties (
	server_name,
	name,
	value,
	sensitivity,
	created_by,
	created_date,
	last_updated_by,
	last_updated_date
)
VALUES (
	'devmint',
	'databaseUserPodMain',
	'common',
	1, -- sensitivity level "protected"
	'12345678',
	DATEOF(NOW()),
	'12345678',
	DATEOF(NOW())
);

INSERT INTO server_specific_system_configuration_properties (
	server_name,
	name,
	value,
	sensitivity,
	created_by,
	created_date,
	last_updated_by,
	last_updated_date
)
VALUES (
	'devbasalt',
	'databaseUserPodMain',
	'common',
	1, -- sensitivity level "protected"
	'12345678',
	DATEOF(NOW()),
	'12345678',
	DATEOF(NOW())
);


-- set Pod Main Database URL for each pod
INSERT INTO server_specific_system_configuration_properties (
	server_name,
	name,
	value,
	sensitivity,
	created_by,
	created_date,
	last_updated_by,
	last_updated_date
)
VALUES (
	'devmint',
	'databaseURLPodLogging',
	'jdbc:sqlserver://192.168.50.51:1433;DatabaseName=Beth_Pod_Main_1',
	1, -- sensitivity level "protected"
	'12345678',
	DATEOF(NOW()),
	'12345678',
	DATEOF(NOW())
);

INSERT INTO server_specific_system_configuration_properties (
	server_name,
	name,
	value,
	sensitivity,
	created_by,
	created_date,
	last_updated_by,
	last_updated_date
)
VALUES (
	'devbasalt',
	'databaseURLPodLogging',
	'jdbc:sqlserver://192.168.50.51:1433;DatabaseName=Beth_Pod_Main_2',
	1, -- sensitivity level "protected"
	'12345678',
	DATEOF(NOW()),
	'12345678',
	DATEOF(NOW())
);

-- set Pod Main Database User for each pod
INSERT INTO server_specific_system_configuration_properties (
	server_name,
	name,
	value,
	sensitivity,
	created_by,
	created_date,
	last_updated_by,
	last_updated_date
)
VALUES (
	'devmint',
	'databaseUserPodLogging',
	'common',
	1, -- sensitivity level "protected"
	'12345678',
	DATEOF(NOW()),
	'12345678',
	DATEOF(NOW())
);

INSERT INTO server_specific_system_configuration_properties (
	server_name,
	name,
	value,
	sensitivity,
	created_by,
	created_date,
	last_updated_by,
	last_updated_date
)
VALUES (
	'devbasalt',
	'databaseUserPodLogging',
	'common',
	1, -- sensitivity level "protected"
	'12345678',
	DATEOF(NOW()),
	'12345678',
	DATEOF(NOW())
);


INSERT INTO server_specific_system_configuration_properties ( name,  value,  description,  server_name,  categories,  created_by,  created_date,  last_updated_by,  last_updated_date)
VALUES ('hostAddress', 'peopleanswers.com', 'Server host address', 'peopleanswers.com' ,null,'29769918',DATEOF(NOW()), '29769918', DATEOF(NOW()));


-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('architecture1TomcatPort', '8080', 'HTTP port for architecture 1.0', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('siteBasePath', '/usr/local/web/peopleanswers.com/dynamic', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('reportBasePath', '/usr/local/web/peopleanswers.com/private/reportServer', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- database
-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('databaseURLCommon', 'jdbc:sqlserver://192.168.50.51:1433;DatabaseName=Beth_common', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('databaseUserCommon', 'common', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('databaseUserPodMain', 'common', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('databaseUserPodLogging', 'common', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('databasePassword', 'xxxPA50', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- Defaults to email_not_set@infor.com if not specified.  User config needed.
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('developmentTestEmail', 'cephalo22@gmail.com', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

------------------------------------------------------
--  END COMMON USER SPECIFIC CONFIGURATION SECTION  --
------------------------------------------------------

-- if in development true or in staging true or not specified, defaults to false
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('inProduction', 'false', 'Flag that tells the server it is in the production environment', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- If in development true, defaults to false otherwise if not specified then false
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('inStaging', 'false', 'Flag that tells the server it is in the staging environment', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Defaults to false
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('inDevelopment', 'true', 'Flag that tells the server it is in development', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- If in development true and not specified then false
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('inStealthMode', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Defaults to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('showStackTraces', 'true', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- http configuration
-- Optional, no default if not specified.  May be overwritten by server specific settings
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('wsSecureHttpPortNumber', '8080', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Optional, no default if not specified.  May be overwritten by server specific settings
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('wsSecureContextRoot', 'ws-secure', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('webServicesSubdomain', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: defaults to pa if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('architecture1ContextRoot', 'pa', 'Context root of archtecture 1.0', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('architecture2CompanyContextRoot', 'pa-company-web', 'Context root of archtecture 2.0 company web app', 1, '18214998', DATEOF(NOW()), '18214998',
        DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('architecture2InternalContextRoot', 'pa-internal-web', 'Context root of archtecture 2.0 company web app', 1, '18214998', DATEOF(NOW()), '18214998',
        DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('architecture2TestingContextRoot', 'pa-testing-web', 'Context root of archtecture 2.0 company web app', 1, '18214998', DATEOF(NOW()), '18214998',
        DATEOF(NOW()));

-- Required: If in production, default to true but allow override from server.xml/cassandra
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('canSwitchProtocols', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- paths
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('databaseUpdatesPath', '/home/mraquet/repos/arch1', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('systemUserBasePath', '/home/tomcat', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('userBasePath', ' /usr/local/web/peopleanswers.com/private/integrations', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- crypto
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('cryptographyKey', 'InEvLnRgAePAzUuOglqiQg==', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('cryptographyKeyNew', 'InEvLnRgAePAzUuOglqiQg==', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

--Required
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('cryptographyKey256', 'InEvLnRgAePAzUuOglqiQg==', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

--Required
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('restrictedLoginCryptographyKey256', 'dDKul2Qp1hiSHlFDNXxCdE4rtTAae9vob71MBoxWm0Y=', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

--Required
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('remoteFileStoreCryptographyKey256', 'HyzVYAgFn3CWG7imtuzmxPBVEjA3IH01J8saQz6RtII=', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Optional: No default if not specified  User config needed
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('pgpPublicKeyRingFile', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Optional: No default if not specified  User config needed
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('pgpSecretKeyRingFile', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Optional: No default if not specified  User config needed
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('pgpSecretKeyPassword', 'peopleanswers', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- database
-- Default to 50 if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('recommendedSqlBlockSize', '50', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified and not in production
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('restrictedAccessDatabase', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- clustering
-- Default to false if not specified, could be overridden by server specific properties
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('canBePrimaryServer', 'true', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified, could be overridden by server specific properties
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('grabPrimaryServer', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified, could be overridden by server specific properties
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('canBeReportServer', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified, could be overridden by server specific properties
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('grabReportServer', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('useReportServer', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Defaults to 3 if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('numReportTokens', '3', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Optional  user config needed
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('datagridS3BucketName', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Optional  user config needed
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('datagridS3AccessKey', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Optional  user config needed
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('datagridS3SecretKey', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('loadTestDataGrid', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('dataGridNoLazyLoad', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('includeServerNameInRMINaming', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('bindRMINames', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('useStubWebServicesLayer', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));





-- external programs
--Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('openOfficeBinDir', '/opt/libreoffice4.4/program', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

--Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('libreOfficeTempInputDirectory', '/usr/local/web/peopleanswers.com/sandbox/libre/in', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

--Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('libreOfficeTempOutputDirectory', '/usr/local/web/peopleanswers.com/sandbox/libre/out', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- architecture 2.0
-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('integrateWithNewArchitecture', 'true', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('timeBasedOneTimeCodeGeneratorKey', 'fc26ce20a3505c751b9711b5b5771da13eaec9bc', 'Must match [com.pa.web.testing.totp.key] in 2.0 config', 1, '18214998',
        DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to 300000L if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES
  ('timeBasedOneTimeCodeGeneratorIntervalLength', '300000L', 'Must match [com.pa.web.testing.totp.key] in 2.0 config', 1, '18214998', DATEOF(NOW()), '18214998',
   DATEOF(NOW()));

-- Default to 8 if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('timeBasedOneTimeCodeGeneratorCodeLength', '8', 'Must match [com.pa.web.testing.totp.key] in 2.0 config', 1, '18214998', DATEOF(NOW()), '18214998',
        DATEOF(NOW()));

-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('messageBrokerActive', 'true', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('messageBrokerHostName1', 'rabbitmq', 'Must match [com.pa.common.message.bus.hostname1] in 2.0 config', 1, '18214998', DATEOF(NOW()), '18214998',
        DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('messageBrokerHostName2', 'rabbitmq', 'Must match [com.pa.common.message.bus.hostname2] in 2.0 config', 1, '18214998', DATEOF(NOW()), '18214998',
        DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('messageBrokerPort', '5672', 'Must match [com.pa.common.message.bus.port] in 2.0 config', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('messageBrokerUserName', 'pa', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('messageBrokerPassword', 'catfox', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- blofeld settings
-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('remoteFileStoreClusterName', 'blofeld', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('remoteFileStoreAuthenticationToken', 'catfox', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('remoteFileStoreIpAddress1', 'blofeld', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('remoteFileStorePort1', '6811', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('remoteFileStoreIpAddress2', 'blofeld', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('remoteFileStorePort2', '6811', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('useSubstituteFiles', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required if useSubstituteFiles is set to true
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('substituteFileName', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required if useSubstituteFiles is set to true
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('substituteFilePath', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- JGroups Config
-- Default to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('datagridUseJGroupsAWSConfiguration', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- Document Converter Config
-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('documentConverterHostName1', 'jodconverter', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('documentConverterHostName2', 'jodconverter', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('documentConverterPort', '10704', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- memcached settings
-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('memcachedServerPort1', 'memcached:11211',
        'Must match [com.pa.web.company.sharedSession.server1] [com.pa.web.internal.sharedSession.server1] [com.pa.web.testing.sharedSession.server1] in 2.0 config',
        1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('memcachedServerPort2',
        'Must match [com.pa.web.company.sharedSession.server2] [com.pa.web.internal.sharedSession.server2] [com.pa.web.testing.sharedSession.server2] in 2.0 config if they exist',
        1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to 12 * 60(minutes in hour) if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('memcachedLongestServerOutageMinutes', '720', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to 12 * 3600(seconds in hour) if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('memcachedSecondsBeforeCacheEntriesExpire', '43200', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to 60 if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('memcachedSecondsBetweenPeriodicReconnectAttempts', '60', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- other config options
-- Defaults to true if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('turnOffProcessThreadsOnDevelopment', 'true', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Defaults to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('allowFtpProcessThreadsInDevelopment', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Defaults to localhost if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('SMTPServerIPAddress', 'smtp-relay.infor.com', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Defaults to BCZm5Mswo0vYfm4FSFrPyCrckxUZf0z7FxbiWwi2ny77qBUBa3MST if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('rpcAuthenticationToken', 'BCZm5Mswo0vYfm4FSFrPyCrckxUZf0z7FxbiWwi2ny77qBUBa3MST', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Defaults to 1 if not specified.  Server specific override 
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('numCompanyCandidatePositionProcessors', '1', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Defaults to 1 if not specified.  Server specific override 
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('numCandidateProcessors', '1', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default value is null
INSERT INTO default_system_configuration_properties (name, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('legacyServicesSecurityToken', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to cookieValuesCacheName if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('cookieValuesCacheName', 'cookieValuesCacheName', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required if in production (.peopleanswers.com).  If in development/testing/staging, it may be okay.
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('sharedDataCookieDomain', '.peopleanswers.com', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Defaults to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('cacheBridgeLoadTest', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- housekeeping
INSERT INTO cql_script_executions (year, tag, last_date_applied) VALUES (2014, '2014-10-02_14111607921_DEVELOPER_ONLY', DATEOF(NOW()));
