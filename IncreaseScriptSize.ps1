# Example: .\IncreaseScriptSize.ps1 -ScriptPath "C:\path\to\your\script.ps1" -SizeIncrease 1024

function Increase-ScriptSize {
    param (
        [string]$ScriptPath,
        [int]$SizeIncrease
    )

    # Read the content of the script
    $scriptContent = Get-Content -Path $ScriptPath -Raw

    # Generate random data to append to the script content
    $randomData = [System.IO.Path]::GetRandomFileName().PadRight($SizeIncrease, "A")

    # Append the random data to the script content
    $modifiedScriptContent = $scriptContent + $randomData

    # Write the modified script content back to the script file
    try {
        Set-Content -Path $ScriptPath -Value $modifiedScriptContent -Encoding ASCII
        Write-Host "Script size increased by $SizeIncrease bytes."
    } catch {
        Write-Host "An error occurred: $_.Exception.Message"
    }
}

# Example usage:
$scriptPath = "C:\path\to\your\script.ps1"
$sizeIncrease = 1024  # Increase by 1 KB (you can adjust this value as needed)

Increase-ScriptSize -ScriptPath $scriptPath -SizeIncrease $sizeIncrease
