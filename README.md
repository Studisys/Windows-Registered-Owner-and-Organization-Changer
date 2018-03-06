<p align="center">
<a href="https://blog.studisys.net">
  <img width="300" height="82" src="https://studisys.net/github/projects/studisys-logo-inline-dark.png"></a>
  <br/>
    <br/>
    <img src="https://studisys.net/github/projects/Windows-Registered-Owner-and-Organization-Changer/windows_registered_user_and_company_changer.png">
      <br/>
        <br/>
  <img src="https://studisys.net/github/projects/Windows-Registered-Owner-and-Organization-Changer/winver.PNG">  <br/>  <br/>
</p>

<img src="https://img.shields.io/badge/type-batch-004D40.svg"> <img src="https://img.shields.io/badge/OS-windows-1A237E.svg"> <img src="https://img.shields.io/badge/stable version-none-red.svg"> <img src="https://img.shields.io/badge/latest version-0.5.0--beta-orange.svg" >  <img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg" > <img src="https://img.shields.io/badge/license-MIT-blue.svg"> [![GitHub forks](https://img.shields.io/github/forks/Studisys/Windows-Registered-Owner-and-Organization-Changer.svg)](https://github.com/Studisys/Windows-Registered-Owner-and-Organization-Changer/network)[![GitHub stars](https://img.shields.io/github/stars/Studisys/Windows-Registered-Owner-and-Organization-Changer.svg)](https://github.com/Studisys/Windows-Registered-Owner-and-Organization-Changer/stargazers)

<p align="center">Last Version : 0.5.0-beta (March 06th 2018)</p>


----------
# Welcome to the Windows Registered Owner and Organization Changer Project !

<p align="center">
  <img src="https://studisys.net/github/projects/Windows-Registered-Owner-and-Organization-Changer/main_menu.PNG"> 
</p>

This is a script allows to quickly change the registered owner and organization names as shown in, for example, the winver window.


## Compatibility
This script only works on Windows systems.
This script is currently ***only*** tested on **Windows 10**.
However, it should also work on Windows 7, and maybe on Windows Vista and Windows XP. I just need to test it when I have time.
I do not plan to test it on other systems until I reach satisfying enough results. 

# How to Use

 ## Interactive Mode

This mode displays a basic interface and requires user interaction.
Run the script as Administrator. The script will automatically ask Administrator permissions if you don't do so. In that case, approve the request.


### Display Current User Information

 - Display Current User Information

To display the current user information (registered owner and organization), simply choose `1` and validate.
<p align="center">
  <img src="https://studisys.net/github/projects/Windows-Registered-Owner-and-Organization-Changer/display_current_user_information.gif"> 
</p>

  
 - Set Owner and Organization Names

To set the Owner and Organization Name, choose `2` and :
 

 1. Type-in the desired Owner name and press `Enter`
 2. Then type the desired Organization Name and press `Enter` again

<p align="center">
  <img src="https://studisys.net/github/projects/Windows-Registered-Owner-and-Organization-Changer/set_info.gif"> 
</p>

**Note :** You can leave a field empty if you do not want to change it's property.



 ## Unattended mode
Well, I believe this mode is quite useless because everything can be done via command line without any script. But I still decided to implement one.

**Syntax :**

    windows_registered_owner_and_organization_changer.bat OwnerName OrgName

**Example :** If you want `ThisIsMyFirstName` as Owner name, and `ThisIsMyCompanyName` as Org name, type : 

```
windows_registered_owner_and_organization_changer.bat John Internet
```
<p align="center">
  <img src="https://studisys.net/github/projects/Windows-Registered-Owner-and-Organization-Changer/unattended_double.gif"> 
</p>


# More about this project


## Origin
I wanted to change the Owner and Org names. I had found the way to do it via command line / registry, so I decided to create a small script to make it more user-friendly.

## Features

<img src="https://img.shields.io/badge/Features-Implemented and working-brightgreen.svg">

 - Change the user and org names.
 
<img src="https://img.shields.io/badge/Feat
ures-Implemented but not completely working-yellow.svg">

 - Change the user and org names.

<img src="https://img.shields.io/badge/Features-In Progress-orange.svg">

- None

<img src="https://img.shields.io/badge/Features-Not Implemented-red.svg">

- None



 
<img src="https://img.shields.io/badge/Features-Postponed-4A148C.svg">

- None

----------

## Known issues
- Interactive mode
	- Using a mix of special characters for the Owner / Org name may cause an unwanted result (glitches in the name, ...)
	- The "Display Current User Information" (option 1) embedded in the script can't read and display names consisting of two or more words. However, it is still possible to use these names, simply verify the outcome with the winver utility

- Unattended mode
	- It is impossible to only set the Owner name or only the Organization name (script will either hang or close without applying changes)
  

## What does this script do ?

### This script edits :
- Registry Keys
	- HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion
		- RegisteredOwner
		- RegisteredOrganization


### This script creates :
- %temp%\\GetAdminRights.vbs
	- For the Administrator Rights if script was not run as Administrator

### This script runs :
- %temp%\\GetAdminRights.vbs
	- Run cmd.exe as admin if the script was not executed as it
- %systemroot%\system32\cmd.exe
	- Runs as admin to operate
- %systemroot%\system32\winver.exe
	- Open winver on demand


## Versioning
I'm tyring to keep versioning as clean as possible. Here is the system I'm using :

- 3-digit version [Major].[Beta].[Alpha]
- [Major] : number of the stable version
- [Beta] : number of the Beta version (number of bugs greatly reduced comparing to the Alpha version)
- [Alpha] : number of the Alpha version (highest number of bugs, features not properly working)

## Changelog
A changelog can be found [here](https://github.com/Studisys/Windows-Registered-Owner-and-Organization-Changer/blob/master/CHANGELOG).

## License [<img src="https://img.shields.io/badge/license-MIT-blue.svg">](https://github.com/Studisys/Windows-Registered-Owner-and-Organization-Changer/blob/master/LICENSE)
This project is licensed under the MIT License.
The license file can be viewed [here](https://github.com/Studisys/Windows-Registered-Owner-and-Organization-Changer/blob/master/LICENSE).
Here are the great lines to remember of this license :

<img src="https://img.shields.io/badge/Commercial%20use%20:-Allowed-brightgreen.svg"> <img src="https://img.shields.io/badge/Modification%20:-Allowed-brightgreen.svg"> <img src="https://img.shields.io/badge/Distribution%20:-Allowed-brightgreen.svg"> <img src="https://img.shields.io/badge/Private%20use%20:-Allowed-brightgreen.svg">
<img src="https://img.shields.io/badge/Liability%20:-None-red.svg"> <img src="https://img.shields.io/badge/Warranty%20:-None-red.svg">
<img src="https://img.shields.io/badge/License%20and%20copyright%20notice%20:-Mandatory-blue.svg">





## Contact and useful links
Thanks for browsing through this project !
Here a few links on how to reach me and/or find me online :

**Personal website :** https://studisys.net
**Personal blog (English) :** https://studisys.net/blog
**Site Web Personnel :** https://studisys.fr
**Blog Personnel (Français) :** https://studisys.fr/blog
**Twitter :** https://twitter.com/Studisys
**LinkedIn :** https://linkedin.com/in/joel-didier
**Email :** studisys@protonmail.com
