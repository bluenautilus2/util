----------------------------------------------------------------------------------------------------------------------------------------
------------------------ CHANGE all PaulTest_Pod_Main_1 to your POD1 database
----------------------------------------------------------------------------------------------------------------------------------------
USE Beth_Pod_Main_1;  
GO
TRUNCATE TABLE Local_SQL_Settings;
INSERT Local_SQL_Settings(Setting_Name, Setting_Value) Values (N'CommonName', 'Beth_Common');

GO

----------------------------------------------------------------------------------------------------------------------------------------
------------------------ CHANGE all PaulTest_Pod_Main_2 to your POD2 database
----------------------------------------------------------------------------------------------------------------------------------------
USE Beth_Pod_Main_2;  
GO
TRUNCATE TABLE Local_SQL_Settings;
INSERT Local_SQL_Settings(Setting_Name, Setting_Value) Values (N'CommonName', 'Beth_Common');
GO
