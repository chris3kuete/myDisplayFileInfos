# Get all files in the specified directory
$files = Get-ChildItem -Path "C:\Users\user\Baller\Documents" -File

# Create a 2D array to store file information
$fileInfoArray = @()
foreach ($file in $files){
    #Create an array for each file with name, extension, size, and last modified
    $fileInfo = @(
        $file.Name,
        $file.Extension,
        $file.Length,
        $file.LastWriteTime
    )
    $fileInfoArray += ,$fileInfo
}

# Print out the file information
foreach ($fileInfo in $fileInfoArray){
    $fileName = $fileInfo[0]
    $fileExtension = $fileInfo[1]
    $fileSize = $fileInfo[2]
    $fileLastModified = $fileInfo[3]

    #Display details for each file
    Write-Host "File: $fileName"
    Write-Host "Extension: $fileExtension"
    Write-Host "Size: $fileSize bytes"
    Write-Host "Last Modified: $fileLastModified"
    Write-Host ""
}

# Sort files by size (descending order) and display
$sortedFileInfoArray = $fileInfoArray | Sort-Object { $_[2] } -Descending
foreach ($fileInfo in $sortedFileInfoArray){
    $fileName = $fileInfo[0]
    $fileSize = $fileInfo[2]

    # Display sorted files with their sizes
    Write-Host "File: $fileName, Size: $fileSize bytes"
}