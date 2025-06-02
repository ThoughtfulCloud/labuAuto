

param (
    [Parameter(Mandatory=$true)]
    [string]$setNumber,
    
    [Parameter(Mandatory=$true)]
    [ValidateLength(14,14)]
    [string]$productId,
    
    [Parameter(Mandatory=$true)]
    [ValidateRange(0,9999)]
    [int]$incrementNumber
)

$edgePath = "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
if (-not (Test-Path $edgePath)) {
    Write-Host "Microsoft Edge not found at the expected location: $edgePath" -ForegroundColor Red
    exit 1
}

$urls = @()
$basePrefix = $productId.Substring(0,4)
$baseSuffix = $productId.Substring(8,6)

try {
    # Create 5 URLs with incrementing numbers
    0..4 | ForEach-Object {
        $currentNumber = $incrementNumber + $_
        $paddedNumber = $currentNumber.ToString("D4") # Ensure 4 digits with leading zeros
        $modifiedId = $basePrefix + $paddedNumber + $baseSuffix
        
        $url = "https://www.popmart.com/us/pop-now/set/$setNumber-$modifiedId"  # Removed the slash
        $urls += $url
        Write-Host "Generated URL: $url"
    }

    # Open all URLs in a single Edge window
    Start-Process $edgePath -ArgumentList $urls

    Write-Host "Successfully opened Microsoft Edge with 5 tabs using incrementing numbers starting from $incrementNumber" -ForegroundColor Green
}
catch {
    Write-Host "An error occurred:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}