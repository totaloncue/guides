# Parsec Overview

## What it is

## Setup

1. Turn off IE ESC on Windows Sever
   1. Go to Server Manager -> Local Server -> IE Enhanced Security Configuration
1. Enable Windows Audio
   1. Go to Run -> services.msc -> Windows Audio
1. Disable CTRL+ALT+DELETE to unlock
   1. Go to Start Menu -> Local Security policy -> Local Policies -> Security Options -> Interactive Logon: Do not require CTRL+ALT+DEL
1. Set password
   1. Control Panel -> Change Account Type
1. Install Nvidia Drivers

   1. Open Powershell as Admin and run following

   ```powershell
   [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
   Invoke-WebRequest https://github.com/GoogleCloudPlatform/compute-gpu-installation/raw/main/windows/install_gpu_driver.ps1 -OutFile C:\install_gpu_driver.ps1
   C:\install_gpu_driver.ps1
   ```

   1. Verify installation

   ```powershell
   &"C:\Program Files\NVIDIA Corporation\NVSMI\nvidia-smi.exe"
   ```

1. Install Nvidia Grid Drivers
1. Run [Parsec script](https://github.com/parsec-cloud/Parsec-Cloud-Preparation-Tool)
1. Download and install Epic Games using a data directory on a different drive
1. Download and install Steam using a data directory on a different drive
1. Ensure UDP open to all ports from source IP to host machine

### GCP

1. Choose Tesla T4 (cheapest even at 16GB) vs Tesla P4 at 8GB
1. Choose Workstation Driver option if full screen wanted
1. Do not select "Turn on Display Device"

```

```
