--
--Beth's version of this script
--

USE pa;

-- local pod setup

truncate pods;
truncate server_specific_system_configuration_properties;
truncate default_system_configuration_properties;

INSERT INTO pods(pod_number,architecture1_port,architecture1_remote_call_subdomain,architecture1_sub_domain,architecture1_tls_port,architecture2_port,architecture2_remote_call_subdomain,architecture2_sub_domain,architecture2_tls_port,created_by,created_date,last_updated_by,last_updated_date,web_services_sub_domain,webservices_port,webservices_remote_call_subdomain) VALUES (1,8080,'squid','squid',8443,9080,'squid','squid',9443,'3',1421247028958,'3',1421247028958,'squid',8443,'squid');

INSERT INTO pods(pod_number,architecture1_port,architecture1_remote_call_subdomain,architecture1_sub_domain,architecture1_tls_port,architecture2_port,architecture2_remote_call_subdomain,architecture2_sub_domain,architecture2_tls_port,created_by,created_date,last_updated_by,last_updated_date,web_services_sub_domain,webservices_port,webservices_remote_call_subdomain) VALUES (2,28080,'buffalo','buffalo',28443,29080,'buffalo','buffalo',29443,'3',1421247028974,'3',1421247028974,'buffalo',28443,'buffalo');

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('siteBaseDomain', 'peopleanswers.com', 'site base domain', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('sharedDataCookieDomain', '.peopleanswers.com', 'cookie domain to use for shared session', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-----end of pod setup

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('architecture1TomcatPort', '8080', 'HTTP port for architecture 1.0', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('siteBasePath', '/home/bstevens', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('reportBasePath', '/home/bstevens/Reports', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- database
-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('databaseURLCommon', 'jdbc:sqlserver://192.168.50.12:1433;DatabaseName=panswersBeth_Common', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('databaseURLPodMain', 'jdbc:sqlserver://192.168.50.12:1433;DatabaseName=panswersBeth_Pod_Main_1', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES
  ('databaseURLPodLogging', 'jdbc:sqlserver://192.168.50.12:1433;DatabaseName=panswersBeth_Pod_Main_1', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

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

-- datagrid
-- Optional  user config needed
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('datagridIPAddress', '230.64.4.1', 'Must match', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Optional  user config needed
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('datagridPort', '45228', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- virtual company admin
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES
  ('sharedDataMulticastAddr', '230.64.4.5', 'Must match [com.pa.web.company.shared_data.jgroups.udp.mcast_addr] in 2.0 config', 1, '18214998', DATEOF(NOW()),
   '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES
  ('sharedDataMulticastPort', '45228', 'Must match [com.pa.web.company.shared_data.jgroups.udp.mcast_port] in 2.0 config', 1, '18214998', DATEOF(NOW()),
   '18214998', DATEOF(NOW()));


-- virtual internal admin
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('sharedInternalDataMulticastAddr', '230.64.4.6', 'Must match [com.pa.web.internal.shared_data.jgroups.udp.mcast_addr] in 2.0 config', 1, '18214998',
        DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('sharedInternalDataMulticastPort', '45228', 'Must match [com.pa.web.internal.shared_data.jgroups.udp.mcast_port] in 2.0 config', 1, '18214998',
        DATEOF(NOW()), '18214998', DATEOF(NOW()));

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
VALUES ('systemUserBasePath', '/home/mraquet/repos/arch1/ca502540', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('userBasePath', '/home/dburgan/work/1', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


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

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('reportServerIPAddress', 'localhost', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

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
VALUES ('openOfficeBinDir', '%CHANGE_ME%', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

--Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('libreOfficeBinDir', '%CHANGE_ME%', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

--Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('libreOfficeTempInputDirectory', '%CHANGE_ME%', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

--Required: needs user config
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('libreOfficeTempOutputDirectory', '%CHANGE_ME%', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


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

-- Defaults to false if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('cacheBridgeLoadTest', 'false', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


INSERT INTO server_specific_system_configuration_properties ( name,  value,  description,  server_name,  categories,  created_by,  created_date,  last_updated_by,  last_updated_date)
VALUES ('hostAddress', 'squid', 'Server host address','squid',null,'29769918',DATEOF(NOW()), '29769918', DATEOF(NOW()));

INSERT INTO server_specific_system_configuration_properties ( name,  value,  description,  server_name,  categories,  created_by,  created_date,  last_updated_by,  last_updated_date)
VALUES ('hostAddress', 'buffalo', 'Server host address','buffalo',null,'29769918',DATEOF(NOW()), '29769918', DATEOF(NOW()));

---------------NEEDED FOR INTEGRATIONS-------	
-- paths
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('databaseUpdatesPath', '/usr/local/web/peopleanswers.com/repos/', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('systemUserBasePath', '/usr/local/web/peopleanswers.com/', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('userBasePath', '/usr/local/web/peopleanswers.com/private/integrations', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('useStubWebServicesLayer', 'true', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('turnOffProcessThreadsOnDevelopment', 'true', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
----------------END OF INTEGRATIONS-------------------



USE pa;

----------------------------------------------------------
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.email.redirect.address', 'cephalo22@gmail.com', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.ehcache.jgroups.multicast.addr', '230.64.4.4', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.ehcache.jgroups.multicast.port', '45228', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.ehcache.jgroups.multicast.addr', '230.64.4.7', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.ehcache.jgroups.multicast.port', '45228', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES
  ('com.pa.web.company.shared_data.jgroups.udp.mcast_addr', '230.64.4.5', 'Must match [sharedDataMulticastAddr] in 1.0 config', 2, '18214998', DATEOF(NOW()),
   '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES
  ('com.pa.web.company.shared_data.jgroups.udp.mcast_port', '45228', 'Must match [sharedDataMulticastPort] in 1.0 config', 2, '18214998', DATEOF(NOW()),
   '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.internal.shared_data.jgroups.udp.mcast_addr', '230.64.4.6', 'Must match [sharedInternalDataMulticastAddr] in 1.0 config', 2, '18214998',
        DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.internal.shared_data.jgroups.udp.mcast_port', '45228', 'Must match [sharedInternalDataMulticastPort] in 1.0 config', 2, '18214998',
        DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.permalink.domainName', 'pa', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
------------------------------------------------------
--  END COMMON USER SPECIFIC CONFIGURATION SECTION  --
------------------------------------------------------



-- insert com.pa.common default_system_configuration_properties data
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.email.behavior', 'REDIRECT', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.email.session.jndi.name', 'java:jboss/mail/Default', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.message.bus.active', 'true', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.message.bus.hostname1', 'rabbitmq', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.message.bus.hostname2', 'rabbitmq', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.message.bus.password', 'catfox', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.message.bus.port', '5672', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.message.bus.username', 'pa', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.site.baseDomain', 'peopleanswers.com', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.site.legacyContextRoot', 'pa', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));



-- insert com.pa.persistence default_system_configuration_properties data
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.blofeld.aes.key', 'HyzVYAgFn3CWG7imtuzmxPBVEjA3IH01J8saQz6RtII=', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.blofeld.authenticationToken', 'catfox', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.blofeld.clusterName', 'blofeld', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.blofeld.ipAddress1', 'blofeld', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.blofeld.ipAddress2', 'blofeld', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.blofeld.port1', '6811', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.blofeld.port2', '6811', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.cache.bridge.active', 'true', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.cache.listener.log.detail', 'NONE', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.cryptography.aes.key', 'InEvLnRgAePAzUuOglqiQg==', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.ehcache.aws.config', 'false', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.hibernate.debug', 'false', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.solr.maxQueryTimeMillis', '30000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.solr.zookeeper.hosts', 'zookeeper:2181', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- insert com.pa.services default_system_configuration_properties data
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.authenticityAlert.activeVersion', '2', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.authenticityAlert.activeVersionPPI2', '3', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.legacy.services.security.token', '6qFUm0zxtcNG0W4YJBfEToKrw9Gz1sGYbRLahLypbecNdF5QlKouzckTnV09y3NH', '', 2, '18214998', DATEOF(NOW()),
        '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.hostname1', 'girt.infor.com', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.hostname2', 'girt.infor.com', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.port', '2010', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.server.connection.timeout', '60000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.scheduler.daysToKeepWorkerTriggerExecutionHistory', '14', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.scheduler.millisToSleepAtStartup', '30000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.scheduler.millisToSleepBetweenCleanupRuns', '3600000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.scheduler.millisToSleepBetweenSchedulingRuns', '30000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.scheduler.queueSize', '1000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.scheduler.threadCount', '50', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- insert com.pa.web.testing default_system_configuration_properties data
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.legacyTestingLogoutPath', 'pa/testLogOut.do', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.message.email.handlerQueueSize', '10000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.message.email.numberOfHandlerThreads', '3', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.message.email.numberOfListenerThreads', '1', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.sharedSession.server1', 'memcached:11211', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.thawteseal.hostname', 'rc1.peopleanswers.com', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.totp.code.length', '8', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.totp.interval.length', '300000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.totp.key', 'fc26ce20a3505c751b9711b5b5771da13eaec9bc', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.user.session.cryptography.aes.key', 'SJvPMsTx6TgwHp0+MyFzvw==', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- insert com.pa.web.company default_system_configuration_properties data
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.company.legacyCompanyLoginPath', 'pa/companyLogIn.do', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.company.businessUnitLogo.url.base', 'https://rc1.peopleanswers.com', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.company.message.email.handlerQueueSize', '10000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.company.message.email.numberOfHandlerThreads', '3', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.company.message.email.numberOfListenerThreads', '1', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.company.sharedSession.server1', 'memcached:11211', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.internal.legacyInternalLoginPath', 'pa/adminLogIn.do', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.internal.message.email.handlerQueueSize', '10000', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.internal.message.email.numberOfHandlerThreads', '3', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.internal.message.email.numberOfListenerThreads', '1', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.internal.sharedSession.server1', 'memcached:11211', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- insert com.pa.permalink default_system_configuration_properties data
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.access.inviteCode', 'https://%s/link/access?invite=%s', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.access.noParameters', 'https://%s/link/access', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.access.requisitionRequisitionTypeCodeWithGeographies', 'https://%s/link/access?job=%s&geoIdsStr=%s', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.access.requisitionRequisitionTypeCodeWithGeographiesAndNoReapply', 'https://%s/link/access?job=%s&geoIdsStr=%s&r=0', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.forgotPassword.allParameters', 'https://%s/link/login?invite=%s&jobs=%s&lang=%s&geoIdsStr=%s&invitedByUserName=%s&src=%s&country=%s&geoPostalCode=%s&geoSearchRadius=%s&isFromPortal=%s&cjbc=%s&r=%s', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.forgotPassword.noParameters', 'https://%s/link/forgotPassword', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.login.companyIdAndBusinessUnitId', 'https://%s/link/login?companyId=%s&businessUnitId=%s&invite=%s', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.login.inviteCode', 'https://%s/link/login?invite=%s', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.login.noParameters', 'https://%s/link/login', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.login.requisitionRequisitionTypeCodeWithGeographies', 'https://%s/link/login?job=%s&geoIdsStr=%s', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.login.requisitionRequisitionTypeCodeWithGeographiesAndNoReapply', 'https://%s/link/access?job=%s&geoIdsStr=%s&r=0', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--
-- INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date)
-- VALUES ('com.pa.permalink.candidateTesting.resetPassword.allParameters', 'https://%s/link/resetPassword?ec=%s', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
--



-- burning glass
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.burningglass.endpoint', 'http://sandbox.api.burning-glass.com/v200/utility/resumeparsertoresdoc', '', 2, '18214998',
        DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.burningglass.consumerkey', 'PeopleAnswers', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.burningglass.consumersecret', '2DD4955A8EA24D5CA9B106E529F6DBA7', '', 2, '18214998', DATEOF(NOW()), '18214998',
        DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.burningglass.apitokenkey', 'Utility', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.burningglass.apitokensecret', '3F5106F3EEF242758F65F94C1FFACD3D', '', 2, '18214998', DATEOF(NOW()), '18214998',
        DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.resume.parsing.burningglass.timeoutseconds', '60', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- other
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('java.net.preferIPv4Stack', 'true', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('spring.profiles.active', 'local', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.document.converter.hostname1', 'jodconverter', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.document.converter.hostname2', 'jodconverter', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.services.document.converter.port', '10704', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


INSERT INTO default_system_configuration_properties (name, value, description, architecture,  created_by, created_date, last_updated_by, last_updated_date, sensitivity)
VALUES ('com.pa.services.linkedin.recruiter.test.apikey', '78jzv0lh4e3jif', 'Recruiter API Key for all non-Prod Cross-Site Awareness testing', 2, '33928125', DATEOF(NOW()), '33928125', DATEOF(NOW()), null);




