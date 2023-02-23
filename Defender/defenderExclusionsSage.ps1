# Defender Exclusions for FSLogix
$Cloudcache = $false             # Set for true if using cloud cache
$StorageAcct = "storageacct"     # Storage Account Name
$ShareName = "share"             # Storage Account's file share name

$extensionlist = `
".DTA", `
".DTH", `
".COA", `
".S50", `
".SLM", `
".PLM", `
".NLM", `
".ILM", `
".BLM", `
".CLM", `
".DLM", `
".SLC", `
".SLI", `
".PRC", `
".PRI", `
".NMC", `
".NMI", `
".BKC", `
".BKI", `
".SKC", `
".SKI", `
".IVC", `
".IVI", `
".SPC", `
".SPI", `
".PCC", `
".PPI", `
".PCI", `
".REC", `
".REI", `
".SAC", `
".SAI", `
".IPC", `
".IPI", `
".PDC", `
".PDI"

$filelist = `
"F:\SageAccounts", `
"F:\SagePayroll"

$processlist = `
"C:\Program Files (x86)\Sage\Accounts\SBDDesktop.exe", `
"C:\Program Files (x86)\Sage\AccountsServiceV28\sg50svc_v28.exe", `
"C:\Program Files (x86)\Sage\AccountsServiceV28\Sage.UK.Accounts50.Data.Service.Control_v28.exe"

Foreach($item in $filelist){
    Add-MpPreference -ExclusionPath $item}
Foreach($item in $processlist){
    Add-MpPreference -ExclusionProcess $item}
Foreach($item in $extensionlist){
    Add-MpPreference -ExclusionExtension $item}


If ($Cloudcache){
    Add-MpPreference -ExclusionPath "%ProgramData%\FSLogix\Cache\*.VHD"
    Add-MpPreference -ExclusionPath "%ProgramData%\FSLogix\Cache\*.VHDX"
    Add-MpPreference -ExclusionPath "%ProgramData%\FSLogix\Proxy\*.VHD"
    Add-MpPreference -ExclusionPath "%ProgramData%\FSLogix\Proxy\*.VHDX"}