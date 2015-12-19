<!---
<cfquery datasource="gemssql">
BACKUP DATABASE [gemstones] TO  DISK = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Backup\gemstonesback.bak' WITH NOFORMAT, NOINIT,  NAME = N'gemstones-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
</cfquery>
--->
<cfquery datasource="gemssql">
BACKUP DATABASE [oriental] TO  DISK = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Backup\oriental.bak' WITH NOFORMAT, NOINIT,  NAME = N'oriental-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
</cfquery>

DB BACKUPS COMPLETED FOR BOTH OC and SEMI
