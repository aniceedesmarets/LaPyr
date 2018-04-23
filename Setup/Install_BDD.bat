sqlcmd -E -S .\SQLEXPRESS -i "%~dp0lib\creat_lapyr.sql"
sqlcmd -E -S .\SQLEXPRESS -i "%~dp0lib\lapyr.sql"
sqlcmd -E -S .\SQLEXPRESS -i "%~dp0lib\donnee_lapyr.sql"
pause