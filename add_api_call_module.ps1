# Script to add "Make an API Call" module to Make.com blueprint
# This uses the generic API call module to avoid version mismatch issues with specific sharing modules

# Read current blueprint
$json = Get-Content "current_blueprint.json" -Raw
$bp = $json | ConvertFrom-Json

# Create the Make an API Call module
# Using version 2 which is standard for this module
$apiCallModule = [ordered]@{
    id = 81
    module = "google-drive:makeAnApiCall"
    version = 1
    mapper = [ordered]@{
        url = "files/{{25.id}}/permissions"
        method = "POST"
        body = '{"role": "writer", "type": "user", "emailAddress": "service@recruiting-now.de"}'
    }
    parameters = [ordered]@{
        __IMTCONN__ = 7740843
    }
    metadata = [ordered]@{
        designer = [ordered]@{
            x = 750
            y = 450
        }
        restore = [ordered]@{
            parameters = [ordered]@{
                __IMTCONN__ = [ordered]@{
                    data = [ordered]@{
                        scoped = "true"
                        connection = "google-restricted"
                    }
                    label = "ki koordinator (ki.koordinator@recruiting-now.de)"
                }
            }
        }
        parameters = @(
            [ordered]@{
                name = "__IMTCONN__"
                type = "account:google-restricted"
                label = "Connection"
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
        $newFlow += $apiCallModule
    }
}

# Update the blueprint
$bp.flow = $newFlow

# Convert to JSON and save
$updatedJson = $bp | ConvertTo-Json -Depth 100
$updatedJson | Out-File "api_call_blueprint.json" -Encoding UTF8

Write-Output "Blueprint updated with API Call module"
