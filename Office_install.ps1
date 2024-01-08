$tmpFolder = "c:\temp"
mkdir $tmpFolder
cd $tmpFolder
Invoke-WebRequest -Uri https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_16731-20398.exe -OutFile officedeploymenttool_16731-20398.exe
.\officedeploymenttool_16731-20398.exe /extract:./office /quiet 
cd office

Invoke-WebRequest -Uri 
.\setup.exe /download ..\office-Configuration-all-languages.xml  
.\setup.exe /configure ..\office-Configuration-all-languages.xml
cd ..
#Get-ChildItem -Path ./office | Remove-Item -Force -Recurse
#rmdir ./office

Get-ChildItem -Path $tmpFolder | Remove-Item -Force -Recurse
rmdir $tmpFolder
