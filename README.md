# Maya Config Installer for Blender

[🇯🇵 日本語はこちら](README_JP.md)

## Overview

This script is designed for the following Blender add-ons:
- [MayaConfigPro](https://formaffinity.gumroad.com/l/wDpgH?layout=profile&recommended_by=library)
- [MayaConfigLite](https://formaffinity.gumroad.com/l/FKhQL?layout=profile&recommended_by=library)

This script can be used to automatically install [Maya Config Addon For Blender](https://formaffinity.gumroad.com/l/FKhQL?layout=profile&recommended_by=library) and [Maya Config Pro](https://formaffinity.gumroad.com/l/wDpgH?layout=profile&recommended_by=library) created by FORMAFFINITY.

- Select a Blender installation directory.
- Verify the presence of `blender.exe`.
- Identify the Blender version folder (starting with "4").
- Set up necessary directories.
- Extract and copy configuration files from a ZIP archive.
- Launch Blender with administrator privileges.

## Requirements
- **Operating System:** Windows
- **Blender Version:** 4.0 or later (recommended)
- **PowerShell:** Version 5.1 or later
- **Administrator Privileges:** Required for script execution

## Installation & Usage

### 1. Download & Extract
1. Download this repository or clone it using:
   ```sh
   git clone https://github.com/yozorakumo/BlenderMayaConfig_Installer.git
   ```
2. Navigate to the script folder:
   ```sh
   cd BlenderMayaConfig_Installer
   ```

### 2. Run the Script
1. Open PowerShell **as Administrator**.
2. Navigate to the script location and execute:
   ```powershell
   .\BlenderMayaConfigInstall.ps1
   ```
3. Follow the on-screen instructions to select directories and install configurations.

### 3. Verify Configuration in Blender
- Open Blender and check if the Maya key configuration has been applied successfully.

## Notes
- The script will create necessary directories if they do not exist.
- If Blender is installed as a **portable version**, the script will attempt to detect it.
- Ensure the ZIP file contains the required configuration files before running the script.

## Troubleshooting
| Issue | Solution |
|--------|----------|
| "Blender.exe not found" | Ensure you selected the correct Blender installation directory. |
| "Error extracting ZIP file" | Check if the ZIP file is valid and not corrupted. |
| "Script requires administrator privileges" | Run PowerShell as Administrator. |

## License
This project is licensed under the **MIT License**. See the `LICENSE` file for details.

## Author
- Yozorakumo
- GitHub: [Yozorakumo](https://github.com/yozorakumo)

