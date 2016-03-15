--
-- 2014-10-02_14111608017_DEVELOPER_ONLY.cql  - DEVELOPER ONLY SCRIPT
-- PA-XXXXX                                   - DEVELOPER ONLY SCRIPT
-- Michael Raquet                             - DEVELOPER ONLY SCRIPT
-- DDL                                        - DEVELOPER ONLY SCRIPT
-- Pre-Deployment                             - DEVELOPER ONLY SCRIPT
--
-- Contains the necessary system properties to start 2.0
--
-- DEVELOPER ONLY SCRIPT

USE pa;


----------------------------------------------------------
--   BEGIN COMMON USER SPECIFIC CONFIGURATION SECTION   --
--                                                      --
-- Replace all %CHANGE_ME% placeholders with your       --
-- environment specific settings.  Once complete,       --
-- uncomment the 'USE pa' statement to fix the script   --
-- to allow for successful execution.                   --
----------------------------------------------------------
INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.common.email.redirect.address', 'XXX@infor.com', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.ehcache.jgroups.multicast.addr', '230.64.5.129', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.persistence.ehcache.jgroups.multicast.port', '45129', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.ehcache.jgroups.multicast.addr', '230.64.5.129', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.testing.ehcache.jgroups.multicast.port', '45129', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES
  ('com.pa.web.company.shared_data.jgroups.udp.mcast_addr', '230.64.5.129', 'Must match [sharedDataMulticastAddr] in 1.0 config', 2, '18214998', DATEOF(NOW()),
   '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES
  ('com.pa.web.company.shared_data.jgroups.udp.mcast_port', '45131', 'Must match [sharedDataMulticastPort] in 1.0 config', 2, '18214998', DATEOF(NOW()),
   '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.internal.shared_data.jgroups.udp.mcast_addr', '230.64.5.129', 'Must match [sharedInternalDataMulticastAddr] in 1.0 config', 2, '18214998',
        DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.web.internal.shared_data.jgroups.udp.mcast_port', '45130', 'Must match [sharedInternalDataMulticastPort] in 1.0 config', 2, '18214998',
        DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('com.pa.permalink.domainName', '', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));
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
VALUES ('com.pa.site.baseDomain', 'localpeopleanswers.com', '', 2, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

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
localpeopleanswers

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

INSERT INTO pods (pod_number, architecture1_port, architecture1_sub_domain, architecture1_tls_port, architecture2_port, architecture2_sub_domain, architecture2_tls_port, created_by, created_date, last_updated_by, last_updated_date, web_services_sub_domain, webservices_port) 
VALUES (1,8080,'mint',8443,9080,'mint',9443,'3',1409467201983,'18214998',1411410282265,'',8444);

INSERT INTO pods (pod_number, architecture1_port, architecture1_sub_domain, architecture1_tls_port, architecture2_port, architecture2_sub_domain, architecture2_tls_port, created_by, created_date, last_updated_by, last_updated_date, web_services_sub_domain, webservices_port) 
VALUES (2,28080,'basalt',28443,29080,'basalt',29443,'3',1409467201983,'18214998',1411410282265,'',8444);

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('siteBaseDomain', 'localpeopleanswers.com', 'site base domain (typically localhost in development or peopleanswers.com in production)', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
VALUES ('sharedDataCookieDomain', '.localpeopleanswers.com', 'cookie domain to use for shared session', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));


-- housekeeping
INSERT INTO cql_script_executions (year, tag, last_date_applied) VALUES (2014, '2014-10-02_1411608017_DEVELOPER_ONLY', DATEOF(NOW()));



