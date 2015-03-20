####What is it?

A [PoshDevOps](https://github.com/PoshDevOps/PoshDevOps) task that pushes one or more [Chocolatey](https://chocolatey.org/) packages to a .nupkg source

####How do I install it?

```PowerShell
Add-PoshDevOpsTask -Name "YOUR-CISTEP-NAME" -PackageId "PushChocolateyPackage"
```

####What parameters are available?

#####IncludeNupkgFilePath
A String[] representing included .nupkg file paths. Either literal or wildcard paths are supported.
```PowerShell
[String[]]
[ValidateCount(1,[Int]::MaxValue)]
[Parameter(
    Mandatory=$true,
    ValueFromPipelineByPropertyName = $true)]
$IncludeNupkgFilePath
```

#####ExcludeFileNameLike
A String[] representing .nupkg file names to exclude. Either literal or wildcard names are supported.
```PowerShell
[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$ExcludeFileNameLike
```

#####Recurse
A Switch representing whether to recursively search directories below $IncludeNupkgFilePath.
```PowerShell
[Switch]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$Recurse
```

#####SourceUrl
A String representing the url of the .nupkg source being pushed to.
```PowerShell
[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$SourceUrl = 'https://chocolatey.org/api/v2/'
```

#####ApiKey
A String representing the api key to use to authenticate against the .nupkg source being pushed to.
```PowerShell
[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$ApiKey
```

####What's the build status?
![](https://ci.appveyor.com/api/projects/status/lk1l562hwcr87jbu?svg=true)

