# halt immediately on any errors which occur in this module
$ErrorActionPreference = 'Stop'

function EnsureChocolateyInstalled(
[String]
[ValidateNotNullOrEmpty()]
$PathToChocolateyExe){
    # install chocolatey
    try{
        Get-Command $PathToChocolateyExe -ErrorAction Stop | Out-Null
    }
    catch{             
        iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
    }   
}

function Invoke-PoshDevOpsTask(
[String[]]
[ValidateCount(1,[Int]::MaxValue)]
[Parameter(
    Mandatory=$true,
    ValueFromPipelineByPropertyName = $true)]
$IncludeNupkgFilePath,

[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$ExcludeFileNameLike,

[switch]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$Recurse,

[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$SourceUrl = 'https://chocolatey.org/api/v2/',

[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$ApiKey,

[String]
[ValidateNotNullOrEmpty()]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$PathToChocolateyExe = 'C:\ProgramData\chocolatey\bin\chocolatey.exe'){

    EnsureChocolateyInstalled -PathToChocolateyExe $PathToChocolateyExe
    
    $NupkgFilePaths = gci -Path $IncludeNupkgFilePath -Filter '*.nupkg' -File -Exclude $ExcludeFileNameLike -Recurse:$Recurse | ?{!$_.PSIsContainer} | %{$_.FullName}
        
Write-Debug `
@"
`Located packages:
$($NupkgFilePaths | Out-String)
"@

    foreach($nupkgFilePath in $NupkgFilePaths)
    {
        $chocoParameters = @('push',$nupkgFilePath,'-Source',$SourceUrl)

        if($ApiKey){
            $chocoParameters += @('-ApiKey',$ApiKey)
        }

Write-Debug `
@"
Invoking nuget:
$PathToChocolateyExe $($chocoParameters|Out-String)
"@
        & $PathToChocolateyExe $chocoParameters
        
        # handle errors
        if ($LastExitCode -ne 0) {
            throw $Error
        
        }

    }

}

Export-ModuleMember -Function Invoke-PoshDevOpsTask
