# Script to add sharing module to Make.com blueprint

# Read current blueprint
$json = Get-Content "current_blueprint.json" -Raw
$bp = $json | ConvertFrom-Json

# Create the new sharing module
$shareModule = [ordered]@{
    id         = 81
    module     = "google-drive:shareAFile"
    version    = 1
    mapper     = [ordered]@{
        fileId                = "{{25.id}}"
        type                  = "user"
        role                  = "writer"
        emailAddress          = "service@recruiting-now.de"
        sendNotificationEmail = $false
    }
    parameters = [ordered]@{
        __IMTCONN__ = 7740843
    }
    metadata   = [ordered]@{
        designer   = [ordered]@{
            x = 750
            y = 450
        }
        expect     = @(
            [ordered]@{name = "fileId"; type = "text"; label = "File ID"; required = $true }
            [ordered]@{name = "role"; type = "select"; label = "Role"; required = $true }
            [ordered]@{name = "type"; type = "select"; label = "Type"; required = $true }
            [ordered]@{name = "emailAddress"; type = "email"; label = "Email Address"; required = $true }
            [ordered]@{name = "sendNotificationEmail"; type = "boolean"; label = "Send Notification Email"; required = $false }
        )
        restore    = [ordered]@{
            expect     = [ordered]@{
                role = [ordered]@{mode = "chose"; label = "Writer" }
                type = [ordered]@{mode = "chose"; label = "User" }
            }
            parameters = [ordered]@{
                __IMTCONN__ = [ordered]@{
                    data  = [ordered]@{
                        scoped     = "true"
                        connection = "google-restricted"
                    }
                    label = "ki koordinator (ki.koordinator@recruiting-now.de)"
                }
            }
        }
        parameters = @(
            [ordered]@{
                name     = "__IMTCONN__"
                type     = "account:google-restricted"
                label    = "Connection"
                required = $true
            }
        )
    }
}

# Insert the module after module 25 (Create a Folder)
$newFlow = @()
foreach ($item in $bp.flow) {
    $newFlow += $item
    if ($item.id -eq 25) {
        $newFlow += $shareModule
    }
}

# Update the blueprint
$bp.flow = $newFlow

# Convert to JSON and save
$updatedJson = $bp | ConvertTo-Json -Depth 100
$updatedJson | Out-File "modified_blueprint.json" -Encoding UTF8

Write-Output "Modified blueprint saved with $($newFlow.Count) modules"
Write-Output "New module added after module 25"
