# Maya Config Installer for Blender / Mayaコンフィグインストーラー for Blender

## Overview / 概要
This PowerShell script automates the process of configuring Blender to use a custom Maya-style key configuration. It allows users to:
- Select a Blender installation directory.
- Verify the presence of `blender.exe`.
- Identify the Blender version folder (starting with "4").
- Set up necessary directories.
- Extract and copy configuration files from a ZIP archive.
- Launch Blender with administrator privileges.

このPowerShellスクリプトは、BlenderでカスタムのMayaスタイルのキー設定を適用するプロセスを自動化します。
- Blenderのインストールディレクトリを選択
- `blender.exe` の存在を確認
- バージョンフォルダ（"4" で始まるもの）を特定
- 必要なディレクトリをセットアップ
- ZIPアーカイブからファイルを抽出・コピー
- 管理者権限でBlenderを起動

## Requirements / 動作環境
- **Operating System / 対応OS:** Windows
- **Blender Version / 対応Blenderバージョン:** 4.0 以降（推奨）
- **PowerShell:** バージョン 5.1 以降
- **Administrator Privileges / 管理者権限:** スクリプト実行時に必要

## Installation & Usage / インストール & 使用方法

### 1. Download & Extract / ダウンロード & 展開
1. Download this repository or clone it using:
   ```sh
   git clone https://github.com/Yozorakumo/BlenderMayaConfig_Installer.git
   ```
2. Navigate to the script folder:
   ```sh
   cd BlenderMayaConfig_Installer
   ```

1. リポジトリをダウンロードするか、以下のコマンドでクローンします:
   ```sh
   git clone https://github.com/Yozorakumo/BlenderMayaConfig_Installer.git
   ```
2. スクリプトのフォルダに移動します:
   ```sh
   cd BlenderMayaConfig_Installer
   ```

### 2. Run the Script / スクリプトを実行
1. Open PowerShell **as Administrator**.
2. Navigate to the script location and execute:
   ```powershell
   .\BlenderMayaConfig_Installer.ps1
   ```
3. Follow the on-screen instructions to select directories and install configurations.

1. PowerShellを**管理者として実行**します。
2. スクリプトのあるディレクトリに移動し、以下を実行します:
   ```powershell
   .\BlenderMayaConfig_Installer.ps1
   ```
3. 画面の指示に従い、ディレクトリを選択してインストールを進めます。

### 3. Verify Configuration in Blender / Blenderでの設定確認
- Open Blender and check if the Maya key configuration has been applied successfully.
- Blenderを開き、Mayaキー設定が適用されているか確認してください。

## Notes / 注意事項
- The script will create necessary directories if they do not exist.
- If Blender is installed as a **portable version**, the script will attempt to detect it.
- Ensure the ZIP file contains the required configuration files before running the script.

- スクリプトは、必要なディレクトリが存在しない場合に自動作成します。
- Blenderが**ポータブル版**としてインストールされている場合、スクリプトがそれを検出します。
- ZIPファイルに必要な設定ファイルが含まれていることを確認してください。

## Troubleshooting / トラブルシューティング
| Issue / 問題 | Solution / 解決策 |
|--------|----------|
| "Blender.exe not found" | Ensure you selected the correct Blender installation directory. |
| "Blender.exe が見つかりません" | 正しいBlenderのインストールディレクトリを選択してください。 |
| "Error extracting ZIP file" | Check if the ZIP file is valid and not corrupted. |
| "ZIPファイルの展開エラー" | ZIPファイルが破損していないか確認してください。 |
| "Script requires administrator privileges" | Run PowerShell as Administrator. |
| "スクリプトには管理者権限が必要です" | PowerShellを管理者権限で実行してください。 |

## License / ライセンス
This project is licensed under the **MIT License**. See the `LICENSE` file for details.

このプロジェクトは**MITライセンス**のもとで提供されています。詳細は`LICENSE`ファイルを参照してください。

## Author / 作者
- Yozorakumo
- GitHub: [Yozorakumo](https://github.com/yozorakumo)

