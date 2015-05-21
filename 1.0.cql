--
--Beth's version of this script
--

USE pa;

-- localhost pod setup

INSERT INTO pods (pod_number, architecture1_port, architecture1_sub_domain, architecture1_tls_port, architecture2_port, architecture2_sub_domain, architecture2_tls_port, created_by, created_date, last_updated_by, last_updated_date, web_services_sub_domain, webservices_port) 
VALUES (1,8080,'',8443,9080,'',9443,'3',1409467201983,'18214998',1411410282265,'',8444);

INSERT INTO pods (pod_number, architecture1_port, architecture1_sub_domain, architecture1_tls_port, architecture2_port, architecture2_sub_domain, architecture2_tls_port, created_by, created_date, last_updated_by, last_updated_date, web_services_sub_domain, webservices_port) 
VALUES (2,28080,'',28443,29080,'',29443,'3',1409467201983,'18214998',1411410282265,'',8444);


INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('siteBaseDomain', 'localhost', 'site base domain (typically localhost in development or peopleanswers.com in production)', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('sharedDataCookieDomain', 'localhost', 'cookie domain to use for shared session', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

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
VALUES ('messageBrokerHostName1', 'nucleus', 'Must match [com.pa.common.message.bus.hostname1] in 2.0 config', 1, '18214998', DATEOF(NOW()), '18214998',
        DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('messageBrokerHostName2', 'nucleus', 'Must match [com.pa.common.message.bus.hostname2] in 2.0 config', 1, '18214998', DATEOF(NOW()), '18214998',
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
VALUES ('remoteFileStoreIpAddress1', 'nucleus', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('remoteFileStorePort1', '6811', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('remoteFileStoreIpAddress2', 'nucleus', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

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
VALUES ('documentConverterHostName1', 'nucleus', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('documentConverterHostName2', 'nucleus', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('documentConverterPort', '10704', '', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- memcached settings
-- Default to null if not specified
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('memcachedServerPort1', 'nucleus:11211',
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
VALUES ('hostAddress', 'localhost', 'Server host address','localhost',null,'29769918',DATEOF(NOW()), '29769918', DATEOF(NOW()));

INSERT INTO server_specific_system_configuration_properties ( name,  value,  description,  server_name,  categories,  created_by,  created_date,  last_updated_by,  last_updated_date)
VALUES ('hostAddress', 'peopleanswers.com', 'Server host address','squid',null,'29769918',DATEOF(NOW()), '29769918', DATEOF(NOW()));

INSERT INTO server_specific_system_configuration_properties ( name,  value,  description,  server_name,  categories,  created_by,  created_date,  last_updated_by,  last_updated_date)
VALUES ('hostAddress', 'peopleanswers.com', 'Server host address','buffalo',null,'29769918',DATEOF(NOW()), '29769918', DATEOF(NOW()));

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


