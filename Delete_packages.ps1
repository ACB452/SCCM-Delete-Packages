$packages =  "NWT001F8" , "NWT00062"

foreach ($package in $packages) {
    try {
        get-cmpackage -Id $package
        # remove-cmpackage -Id $package
    }
    catch {
        # add output into file results
        "Package ID $package doesn't exist and already deleted." | Out-file -FilePath "C:\Users\abraham.baquilod.su\Desktop\package_delete.txt" -Append
        write-host "package already deleted"
    }
    
}


# $packages = get-cmpackage -Id "NWT001F8" , "NWT00062"
$packages = get-cmpackage -Id "NWT001F8" , "NWT00062"

foreach ($package in $packages) {
    if ($package -ne $null) {
        get-cmpackage -Id $package -fast
        # remove-cmpackage -Id $package
    }
    elseif ($package -eq $null) {
        # add output into file results
        "Package ID $package doesn't exist and already deleted." | Out-file -FilePath "C:\Users\abraham.baquilod.su\Desktop\package_delete.txt" -Append
        write-host "package already deleted"
    }
    
}


$packages = "NWT001F8" , "NWT00062"

$packages = get-content "C:\Users\abraham.baquilod.su\Desktop\PackageIDs.txt"

foreach ($package in $packages) {
    $var = get-cmpackage -Id $package -Fast
    if ($var -ne $null) {
        Write-Output "$package is present." # | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\package_delete.txt" -Append
        #remove-cmpackage -Id $package -force
    }
    elseif ($var -eq $null) {
        write-output "Package ID $package doesn't exist or already removed from SCCM." | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\package_delete.txt" -Append
    }
}  

# proper operator

# not reading properly
# test-cmpackage?

# Delete packages
# set variables
# add delete files/folders

$packages = get-content "C:\Users\abraham.baquilod.su\Desktop\PackageIDs.txt"

foreach ($package in $packages) {
    $var = get-cmpackage -Id $package -Fast
    if ($var -ne $null) {
        Write-Output "Package $package is present and removed from SCCM at: $(get-date -Format G)." | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\package_delete.txt" -Append
        remove-cmpackage -Id $package -force
    }
    elseif ($var -eq $null) {
        write-output "Package $package doesn't exist or already removed from SCCM at: $(get-date -Format G)." | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\package_delete.txt" -Append
    }
}  

# connect network drives
$folders = New-PSDrive –Name “K” –PSProvider FileSystem –Root “\\AZSD01F72T1N2L\c$\temp\MobaXterm\toDelete” –Persist

$folders = Get-Content  "C:\Users\abraham.baquilod\Desktop\Delete Packages\location.txt"


foreach ($folder in $folders) {
    if ( $folder -ne $null) {
        Remove-Item -LiteralPath $folder -Force -Recurse
    }

    # check path if deleted
    # if (Test-Path -Path $folder) {
    try {
        if ($folder -eq $null) {
            write-output "Package source folder deleted at: $(Get-Date -Format G)." | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\package_delete.txt" -Append
        }
        elseif ($folder -ne $null) {
            Write-Output "Package source folder is not deleted: $(get-date -Format G)" | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\package_delete.txt" -Append
        }
    }
    <#
    catch [System.Management.Automation.ItemNotFoundException] {
        Write-Output "Folder does not exist."
    }
    catch {
        #$_.Exception.Message
        Write-Host "Catch"
    }#>
}



#######################
# Delete packages

$packages = get-content "C:\Users\abraham.baquilod.su\Desktop\Delete Packages\PackageIDs.txt"


foreach ($package in $packages) {
    $var = get-cmpackage -Id $package -Fast
    if ($var -ne $null) {
        Write-Output "Package $package is present and removed from SCCM at: $(get-date -Format G)." | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\Delete Packages\package_delete.txt" -Append
        remove-cmpackage -Id $package -force
    }
    elseif ($var -eq $null) {
        write-output "Package $package doesn't exist or already removed from SCCM at: $(get-date -Format G)." | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\Delete Packages\package_delete.txt" -Append
    }
}  


$folders = Get-Content  "C:\Users\abraham.baquilod.su\Desktop\Delete Packages\location_test.txt"

foreach ($folder in $folders) {
    if ( $folder -ne $null) {
        Remove-Item -LiteralPath $folder -Force -Recurse -ErrorAction SilentlyContinue
        
        # check path if deleted
        # if (Test-Path -Path $folder) {
        if ($folder -eq $null) {
            write-output "Package source folder $folder deleted at: $(Get-Date -Format G)." | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\Delete Packages\package_delete.txt" -Append
        }
        elseif ($folder -ne $null) {
            Write-Output "Package source folder $folder is already deleted. Checked at: $(get-date -Format G)" | Out-File -FilePath "C:\Users\abraham.baquilod.su\Desktop\Delete Packages\package_delete.txt" -Append
        }
    } 
   
}



#### Delete SCCM Collections ####
