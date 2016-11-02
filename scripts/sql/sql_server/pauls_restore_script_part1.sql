USE Master;

SET NOCOUNT ON
DECLARE @strSQL nvarchar(max), @pathData nvarchar(50), @pathLog nvarchar(50), @DBname nvarchar(50), @svrName nvarchar(100), @RestorePath nvarchar(100)
 
--- change these variables here
SELECT @pathData = 'C:\database\';  --- primary data path --- this path must exist
SELECT @pathLog  = 'C:\database\';   --- primary log location --- this path must exist
SELECT @DBname = 'Beth';  -- db name, in this example, “PaulTest” become PaulTest_Common, PaulTest_Pod_Main_1, PaulTest_Pod_Main_2
SELECT @RestorePath = 'C:\bak\'  --- where you copied your BAK files too 



--- Build dynamic SQL for database restore
SELECT @strSQL = 'USE master;
IF EXISTS (SELECT name from sys.databases WHERE name = N''' + @DBname + '_Common'') 
ALTER DATABASE [' + @DBname + '_Common] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

RESTORE DATABASE [' + @DBname + '_Common] FROM  DISK = N''' + @RestorePath + 'Common_Dev.bak'' WITH  FILE = 1
   ,  MOVE N''panswers_dat'' TO N''' + @pathData + @DBname + '_Common.mdf''
   ,  MOVE N''panswers_dat2'' TO N''' + @pathData + @DBname+ '_Common_dat2.ndf''
   ,  MOVE N''panswers_ndf'' TO N''' + @pathData +  @DBname+ '_Common.ndf''
   ,  MOVE N''panswers_log'' TO N''' + @pathLog +  @DBname+'_Common.ldf'',  NOUNLOAD,  REPLACE,  STATS = 5';


SELECT 'The following SQL is executing:';
SELECT @strSQL;
EXEC sp_executesql @strSQL;
 

SELECT 'All Done with Common!'


---  START POD 1
SELECT @strSQL = 'USE master;
IF EXISTS (SELECT name from sys.databases WHERE name = N''' + @DBname + '_Pod_Main_1'')
ALTER DATABASE [' + @DBname + '_Pod_Main_1] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

RESTORE DATABASE [' + @DBname + '_Pod_Main_1] FROM  DISK = N''' + @RestorePath  + 'Pod_Main_1_Dev.bak'' WITH  FILE = 1
   ,  MOVE N''panswers_dat'' TO N''' + @pathData +  @DBname+ '_Pod_Main_1.mdf''
   ,  MOVE N''panswers_dat2'' TO N''' + @pathDAta + @DBname+ '_Pod_Main_1_dat2.ndf''
   ,  MOVE N''panswers_ndf'' TO N''' + @pathData +  @DBname+ '_Pod_Main_1.ndf''
   ,  MOVE N''panswers_log'' TO N''' + @pathLog +  @DBname+'_Pod_Main_1.ldf'',  NOUNLOAD,  REPLACE,  STATS = 5';


SELECT 'The following SQL is executing:';
SELECT @strSQL;
EXEC sp_executesql @strSQL;

 
SELECT 'All Done with Pod_Main_1!'



---- START POD 2
SELECT @strSQL = 'USE master;
IF EXISTS (SELECT name from sys.databases WHERE name = N''' + @DBname + '_Pod_Main_2'')
ALTER DATABASE [' + @DBname + '_Pod_Main_2] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

RESTORE DATABASE [' + @DBname + '_Pod_Main_2] FROM  DISK = N''' + @RestorePath  + 'Pod_Main_2_Dev.bak'' WITH  FILE = 1
   ,  MOVE N''panswers_dat'' TO N''' + @pathData +  @DBname+ '_Pod_Main_2.mdf''
   ,  MOVE N''panswers_dat2'' TO N''' + @pathDAta + @DBname+ '_Pod_Main_2_dat2.ndf''
   ,  MOVE N''panswers_ndf'' TO N''' + @pathData +  @DBname+ '_Pod_Main_2.ndf''
   ,  MOVE N''panswers_log'' TO N''' + @pathLog +  @DBname+'_Pod_Main_2.ldf'',  NOUNLOAD,  REPLACE,  STATS = 5';


SELECT 'The following SQL is executing:';
SELECT @strSQL;
EXEC sp_executesql @strSQL;

SELECT 'All Done with Pod_Main_2!'

SELECT ''
SELECT 'All Done!!!'
GO

