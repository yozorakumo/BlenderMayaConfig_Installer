# Mayaコンフィグインストーラー for Blender

[🌍 English version](README.md)

## 概要

このPowerShellスクリプトは、BlenderでカスタムのMayaスタイルのキー設定を適用するプロセスを自動化します。

- Blenderのインストールディレクトリを選択
- `blender.exe` の存在を確認
- バージョンフォルダ（"4" で始まるもの）を特定
- 必要なディレクトリをセットアップ
- ZIPアーカイブからファイルを抽出・コピー
- 管理者権限でBlenderを起動

## 動作環境

- **対応OS:** Windows
- **対応Blenderバージョン:** 4.0 以降（推奨）
- **PowerShell:** バージョン 5.1 以降
- **管理者権限:** スクリプト実行時に必要

## インストール & 使用方法

### 1. ダウンロード & 展開

1. リポジトリをダウンロードするか、以下のコマンドでクローンします:
   ```sh
   git clone https://github.com/yozorakumo/BlenderMayaConfig_Installer.git
   ```
2. スクリプトのフォルダに移動します:
   ```sh
   cd YOUR_REPOSITORY
   ```

### 2. スクリプトを実行

1. PowerShellを**管理者として実行**します。
2. スクリプトのあるディレクトリに移動し、以下を実行します:
   ```powershell
   .\BlenderMayaConfigInstall.ps1
   ```
3. 画面の指示に従い、ディレクトリを選択してインストールを進めます。

### 3. Blenderでの設定確認

- Blenderを開き、Mayaキー設定が適用されているか確認してください。

## 注意事項

- スクリプトは、必要なディレクトリが存在しない場合に自動作成します。
- Blenderが**ポータブル版**としてインストールされている場合、スクリプトがそれを検出します。
- ZIPファイルに必要な設定ファイルが含まれていることを確認してください。

## トラブルシューティング

| 問題 | 解決策 |
|--------|----------|
| "Blender.exe not found" | 正しいBlenderのインストールディレクトリを選択してください。 |
| "Error extracting ZIP file" | ZIPファイルが破損していないか確認してください。 |
| "Script requires administrator privileges" | PowerShellを管理者権限で実行してください。 |

## ライセンス

このプロジェクトは**MITライセンス**のもとで提供されています。詳細は`LICENSE`ファイルを参照してください。

## 作者

- Yozorakumo
- GitHub: [Yozorakumo](https://github.com/yozorakumo)

