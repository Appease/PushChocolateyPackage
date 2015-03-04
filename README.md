####What is it?

A [PoshCI](https://github.com/PoshCI/PoshCI) step that pushes one or more Chocolatey packages to a .nupkg source

####How do I install it?

```PowerShell
Add-CIStep -Name "YOUR-CISTEP-NAME" -PackageId "PushChocolateyPackage"
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
![](https://ci.appveyor.com/api/projects/status/c3h4wisdl6syej9w?svg=true)

