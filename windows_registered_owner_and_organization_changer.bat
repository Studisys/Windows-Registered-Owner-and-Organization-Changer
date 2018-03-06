:: This script is quite bad-written, please forgive me for this.
:: At least : it works.

@echo off
set RegisteredOwner = 0
set RegisteredOrganization = 0
goto AdminRightsRoutine

:: ================================================================
::                  Administrator Rights Checker
:: ================================================================

:AdminRightsRoutine
if "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
	>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
		) else (
	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
		)

if '%errorlevel%' NEQ '0' (
goto GetAdminRights
) else ( goto GetAdminRightsSuccess )


:GetAdminRights
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\GetAdminRights.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\GetAdminRights.vbs"
"%temp%\GetAdminRights.vbs"
del "%temp%\GetAdminRights.vbs"
exit /B


:GetAdminRightsSuccess
pushd "%CD%"
CD /D "%~dp0"
goto ConditionCheck

:: ================================================================
::                  Administrator Rights Checker
::                              End
:: ================================================================


:: ================================================================
::                        Condition Check
:: ================================================================
:ConditionCheck
if [%1] == [] if [%2] == [] GOTO Menu
goto Unattended





:: ================================================================
::                           Unattended
:: ================================================================
:Unattended
set RegisteredOwner="%1"
set RegisteredOrganization="%2"
if ["%RegisteredOwner%"] == [""] set RegisteredOwner=" "
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v RegisteredOwner /t REG_SZ /d "%RegisteredOwner%" /f>NUL
if ["%RegisteredOrganization%"] == [""] set RegisteredOrganization=" "
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v RegisteredOrganization /t REG_SZ /d "%RegisteredOrganization%" /f>NUL
exit

:: ================================================================
::                          Interactive
:: ================================================================
:Menu
echo.
echo 				##################################################
echo 				#                    Main Menu                   #
echo 				##################################################
echo.
echo 	 # What do you want to do ?
echo.
echo 	[1] Display current Registered Owner and Organization
echo 	[2] Set Registered Owner and/or Organization
echo 	[3] Open winver (About Windows)
echo 	[4] Show the About section
echo 	[5] Exit
echo.
set /P c=	 Please enter your choice : 
if /I "%c%" EQU "1" goto DisplayInfo
if /I "%c%" EQU "2" goto AskOwner
if /I "%c%" EQU "3" START /W %systemroot%\system32\winver.exe && cls
if /I "%c%" EQU "4" goto About
if /I "%c%" EQU "5" exit
goto Menu



:DisplayInfo
cls
for /f "tokens=3,4" %%a in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion"  /V RegisteredOwner  ^|findstr /ri "REG_SZ"') do set "RegisteredOwner=%%a"
if ["%RegisteredOwner%"] == [""] set RegisteredOwner=" "
for /f "tokens=3" %%a in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion"  /V RegisteredOrganization  ^|findstr /ri "REG_SZ"') do set "RegisteredOrganization=%%a"
if ["%RegisteredOrganization%"] == [""] set RegisteredOrganization=" "
echo.
echo 				##################################################
echo 				#           Current User Information             #
echo 				##################################################
echo.
echo  Registered Owner : %RegisteredOwner%
echo  Organization : %RegisteredOrganization%
echo.
pause
cls
goto Menu


:AskOwner
cls
echo.
echo 				##################################################
echo 				#    Set Registered Owner and/or Organization    #
echo 				##################################################
echo.
echo.
SET /P RegisteredOwner= 	Please enter your desired Owner name (leave blank if you do not wish to change it) : 
goto AskOrganization

:AskOrganization
echo.
SET /P RegisteredOrganization=		Please enter your desired Organization name (leave blank if you do not wish to change it) : 
goto ChangeInformations

:End


:ChangeInformations
:: Set Registered Owner
if "%RegisteredOwner%" == "" goto SetOrg

REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v RegisteredOwner /t REG_SZ /d "%RegisteredOwner%" /f>NUL

:SetOrg
if "%RegisteredOrganization%" == "" goto Menu
:: Set Registered Organization
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v RegisteredOrganization /t REG_SZ /d "%RegisteredOrganization%" /f>NUL
echo.
echo Done !
echo.
pause
cls
goto Menu

:About
cls
echo.
echo 				##################################################
echo 				#                     About                      #
echo 				##################################################
echo.
echo = Tool : Registered Owner and Organization Changer
echo.
echo = Version : 0.5.0-beta
echo.
echo = Release date : March 06th 2018
echo.
echo = Author : Joel Didier
echo.
echo = IT Engeenering Student at exia.CESI (France)
echo.
echo = GitHub : https://github.com/Studisys/Windows-Registered-Owner-and-Organization-Changer
echo.
echo = Website : studisys.net / studisys.fr
echo.
echo = Twitter : @Studisys
echo.
echo = Description : This script allows the user to change the registered owner
echo and organization as displayed, for example, by winver.
echo.
echo = OS Requirements : [Client] Windows XP and higher
echo                   : [Server] Windows Server 2003 and higher
echo.
echo.
pause
cls
goto Menu