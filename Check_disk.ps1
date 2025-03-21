# Desactiver la verification SSL/TLS pour les certificats auto-signes
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

# === CONFIGURATION ===
$glpiUrl = "https://localhost/glpi/apirest.php"
$appToken = "62dRP6Z0rEFmlqv8Aq1LieVMayxrQCicx6QfY3OI"  # le token du User par default de GLPI (super-admin)     
$userToken = "Bm8BIoXIsOdeguxMj2gahJp6GPEvF9bemcDq2PGV" # le token du nouveau user que tu as cree

# === VÉRIFICATION DE L'ESPACE DISQUE ===
$lowDisks = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" | Where-Object {
    $_.FreeSpace / $_.Size -lt 0.05
}

if ($lowDisks.Count -gt 0) {
    # === CRÉATION DU TICKET ===
    $headers = @{
        "App-Token" = $appToken
        "Authorization" = "user_token $userToken"
    }

    $body = @{
        "input" = @{
            "name" = "Alerte : Espace disque critique"
            "content" = "Une partition a moins de 5% d’espace libre."
            "status" = 1
            "urgency" = 4
            "impact" = 3
            "priority" = 5
            "type" = 1
        }
    } | ConvertTo-Json -Depth 10 -Compress

    Invoke-RestMethod -Uri "$glpiUrl/Ticket" -Headers $headers -Method Post -Body $body -ContentType "application/json"

    Write-Host " Ticket envoyé à GLPI"
} else {
    Write-Host " Espace disque OK"
}
