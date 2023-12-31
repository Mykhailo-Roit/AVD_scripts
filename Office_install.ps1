Set-PSDebug -Trace 1

$tmpFolder = "c:\temp\psscript"
mkdir $tmpFolder -Force
cd $tmpFolder

# https://www.microsoft.com/en-us/download/details.aspx?id=49117
Invoke-WebRequest -Uri https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_16731-20398.exe -OutFile officedeploymenttool_16731-20398.exe -verbose
dir

# https://learn.microsoft.com/en-us/deployoffice/overview-office-deployment-tool
# https://config.office.com/deploymentsettings
Invoke-WebRequest -Uri https://raw.githubusercontent.com/Mykhailo-Roit/AVD_scripts/main/office-Configuration-all-languages.xml -Outfile office-Configuration-all-languages.xml -verbose
dir
.\officedeploymenttool_16731-20398.exe /extract:./office /quiet 
sleep 20
cd office

.\setup.exe /download ..\office-Configuration-all-languages.xml  
.\setup.exe /configure ..\office-Configuration-all-languages.xml
cd \
#Get-ChildItem -Path ./office | Remove-Item -Force -Recurse
#rmdir ./office

sleep 10
#Stop-Process setup.exe
Get-ChildItem -Path $tmpFolder -Recurse | Remove-Item -Force -Recurse
#cd c:\
#rmdir $tmpFolder -Force
exit 0
