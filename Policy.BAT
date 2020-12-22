@echo off 

REM Enforce password history 
net accounts /uniquepw:5

REM Set minimum password length 
net accounts /minpwlen:14

REM Set max password age
net accounts /maxpwage:90

REM Set Minimum password age 
net accounts /minpwage:30

pause 