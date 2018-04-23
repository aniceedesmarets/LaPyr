sqlcmd -E -S .\SQLEXPRESS -i %~dp0creat_lapyr.sql
sqlcmd -E -S .\SQLEXPRESS -i %~dp0lapyr.sql
pause