select * from server_specific_system_configuration_properties;
select * from default_system_configuration_properties;

select * from default_system_configuration_properties where name='turnOffProcessThreadsOnDevelopment' and architecture=2;

 INSERT INTO default_system_configuration_properties (name, value, description, architecture, created_by, created_date, last_updated_by, last_updated_date)
 VALUES ('architecture1TomcatPort', '8080', 'HTTP port for architecture 1.0', 1, '18214998', DATEOF(NOW()), '18214998', DATEOF(NOW()));

Select * from default_system_configuration_properties where name='turnOffProcessThreadsOnDevelopment' and architecture=1;

--update default_system_configuration_properties set value='false' where name='turnOffProcessThreadsOnDevelopment' and architecture=1;
