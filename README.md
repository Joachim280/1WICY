# GLPI Helpdesk Project

**Authors:** Joachim Collot and Matthew Li Ching Ng  
**Date:** 25/03/2025  
**Environment:** Windows Server 2025 (VMware)

---

## 📌 Project Goal

This project aims to install and configure a helpdesk solution using **GLPI**.  
Key objectives:

- Host GLPI on an IIS web server
- Use HTTPS with a self-signed certificate
- Deploy and configure GLPI
- Set up automatic inventory using **FusionInventory**
- Automate ticket creation when disk space is low

---

## ⚙️ What We Did

- Installed **IIS** and configured it for GLPI
- Installed **PHP** and **MySQL**, connected to GLPI
- Deployed GLPI and made it accessible at `https://localhost/glpi`
- Created a **self-signed certificate** and set up HTTPS redirection
- Installed the **FusionInventory** plugin in GLPI
- Installed the **FusionInventory Agent** on the server
- Verified that the agent is working — machine appears in *Computers* section
- Wrote a **PowerShell script** to monitor disk space
- Script uses the **GLPI API** to create a ticket if disk space < 5%

---

## 📂 Files Included

- `check_disk.ps1` → PowerShell script for disk monitoring
- `README.md` → This documentation file
- `screenshots/` → Screenshots showing GLPI setup, certificate, and inventory

---

## 🔐 Configuration Notes

Before using the PowerShell script, update it with your valid **GLPI App Token** and **User Token**:

```powershell
$appToken = "YOUR_APP_TOKEN"
$userToken = "YOUR_USER_TOKEN"
