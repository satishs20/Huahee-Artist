@echo off
rem Running this batch file will reset DB 
echo.
echo [31mStopping ArtDBInstance...[0m
echo.
SqlLocalDb stop "HuaheeArtist"

echo.
echo [31mDeleting ArtDBInstance...[0m
echo.
SqlLocalDb delete "HuaheeArtist"

echo.
echo [31mDeleting ArtDB...[0m
echo.
del %userprofile%\HuaheeArtistDB.mdf
del %userprofile%\HuaheeArtistDB_log.ldf

echo.
echo [32mCreating ArtDBInstance...[0m
echo.
SqlLocalDb create "HuaheeArtist"
sqlcmd -S "(localdb)\HuaheeArtist" -Q "CREATE DATABASE HuaheeArtistDB;"
sqlcmd -S "(localdb)\HuaheeArtist" -i "DB_SCHEMA.sql" -o "DBSetup.log"
type DBSetup.log

pause