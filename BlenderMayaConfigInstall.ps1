Add-Type -AssemblyName System.Windows.Forms

# �t�H���_�I���_�C�A���O�iOpenFileDialog�`���j
function Select-Folder($description) {
    Add-Type -AssemblyName System.Windows.Forms
    $folderDialog = New-Object System.Windows.Forms.OpenFileDialog
    $folderDialog.Title = $description
    $folderDialog.ValidateNames = $false
    $folderDialog.CheckFileExists = $false
    $folderDialog.CheckPathExists = $true
    $folderDialog.FileName = "Select Folder"

    if ($folderDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        return [System.IO.Path]::GetDirectoryName($folderDialog.FileName)
    } else {
        return $null
    }
}

# �t�@�C���I���_�C�A���O
function Select-File($description, $filter) {
    Add-Type -AssemblyName System.Windows.Forms
    $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $fileDialog.Title = $description
    $fileDialog.Filter = $filter
    if ($fileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        return $fileDialog.FileName
    } else {
        return $null
    }
}

# Blender�f�B���N�g���I��
Write-Host "Step 1: Selecting Blender directory..."
$blenderDir = Select-Folder "Select the Blender installation directory"
if (-not $blenderDir) { Write-Host "Blender directory selection cancelled."; Read-Host "Press Enter to exit"; exit }

# Blender���s�t�@�C���m�F
$blenderExe = Join-Path $blenderDir 'blender.exe'
if (!(Test-Path $blenderExe)) {
    Write-Host "Error: Blender.exe not found in $blenderDir"
    [System.Windows.Forms.MessageBox]::Show("Blender.exe ��������܂���B�������f�B���N�g����I�����Ă��������B", "�G���[", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    Read-Host "Press Enter to exit"
    exit
}

# Blender�o�[�W�����m�F
Write-Host "Step 2: Checking Blender version..."
if (!(Test-Path $blenderDir)) {
    Write-Host "Error: Specified Blender directory does not exist."
    Read-Host "Press Enter to exit"
    exit
}

# Blender�̃o�[�W�����t�H���_�m�F (4�Ŏn�܂���̂��m�F)
Write-Host "Checking for Blender version folders in: $blenderDir"

try {
    $subDirs = Get-ChildItem -Path $blenderDir -Directory
    if ($subDirs.Count -eq 0) {
        Write-Host "No subdirectories found in $blenderDir"
        throw "Blender�f�B���N�g���Ƀo�[�W�����t�H���_�����݂��܂���B"
    }
    $subDirs | ForEach-Object { Write-Host "Found folder: $($_.Name)" }
    $blenderVersion = $subDirs | Where-Object { $_.Name -match '^4.*$' } | Select-Object -First 1
    if (-not $blenderVersion) {
        throw "Error: No Blender version starting with '4' found in $blenderDir"
    } else {
        Write-Host "Blender version folder detected: $($blenderVersion.Name)"
    }
}
catch {
    Write-Host "�o�[�W�����m�F���ɃG���[���������܂���: $($_.Exception.Message)"
    Read-Host "Press Enter to exit"
    exit
}

# �K�v�ȃp�X�̊m�F�ƍ쐬
Write-Host "Step 3: Setting up paths..."
$startupDir = Join-Path $blenderDir "$($blenderVersion.Name)\scripts\startup"
$keyconfigDir = Join-Path $blenderDir "$($blenderVersion.Name)\scripts\presets\keyconfig"
$configDir = Join-Path $blenderDir "$($blenderVersion.Name)\config"
$tempDir = Join-Path $env:TEMP 'MayaConfigProV1'

# ���[�U�[��AppData�p�X�擾
$appDataKeyconfigDir = Join-Path $env:APPDATA "Blender Foundation\Blender\$($blenderVersion.Name)\scripts\presets\keyconfig"

# portable�f�B���N�g���m�F
$portableKeyconfigDir = if (Test-Path (Join-Path $blenderDir "portable")) { Join-Path $blenderDir "portable\scripts\presets\keyconfig" } else { $null }

# �p�X�����݂��Ȃ��ꍇ�͍쐬
foreach ($dir in @($startupDir, $keyconfigDir, $configDir, $appDataKeyconfigDir, $portableKeyconfigDir)) {
    if ($dir -and !(Test-Path $dir)) {
        Write-Host "Creating missing directory: $dir"
        New-Item -Path $dir -ItemType Directory -Force
    }
}

# ZIP�t�@�C���I��
Write-Host "Step 4: Selecting ZIP file..."
$zipFile = Select-File "Select the MayaConfigProV1.zip file" "ZIP files (*.zip)|*.zip"
if (-not $zipFile) { Write-Host "ZIP file selection cancelled."; Read-Host "Press Enter to exit"; exit }

# ZIP�t�@�C����
Write-Host "Step 5: Extracting ZIP file..."
try {
    if (Test-Path $tempDir) { Remove-Item -Recurse -Force $tempDir }
    Expand-Archive -Path $zipFile -DestinationPath $tempDir -Force
    Write-Host "ZIP file extracted to $tempDir"
} catch {
    Write-Host "Error extracting ZIP file: $($_.Exception.Message)"
    Read-Host "Press Enter to exit"
    exit
}

# �𓀃t�H���_���̃t�@�C���R�s�[
Write-Host "Step 6: Copying files from extracted folder..."
$filesToCopy = @(
    'fa_hotkeys.py', 'Industry_Compatible.py', 'Blender.py',
    'fa_panel_pro.py', 'fa_panel_sidebar.py', 'fa_quadview.py',
    'fa_special_tools.py', 'fa_tab_switcher.py', 'msm_from_object.py',
    'delete_withoutConfirm.py', 'fa_marking_menu.py', 'fa_object2objectselect.py', 'fa_panel_panel.py'
)

foreach ($file in $filesToCopy) {
    $sourcePath = Get-ChildItem -Path $tempDir -Recurse -Filter $file | Select-Object -First 1
    if ($sourcePath) {
        Copy-Item -Path $sourcePath.FullName -Destination $startupDir -Force
        Copy-Item -Path $sourcePath.FullName -Destination $appDataKeyconfigDir -Force
        if ($portableKeyconfigDir) { Copy-Item -Path $sourcePath.FullName -Destination $portableKeyconfigDir -Force }
        Write-Host "Copied $file to $startupDir, $appDataKeyconfigDir, and $portableKeyconfigDir"
    } else {
        Write-Warning "$file not found in extracted folder."
    }
}

# keymap_data �t�H���_�̃R�s�[
$keymapDataSource = Join-Path $keyconfigDir 'keymap_data'
$keymapDataDestination = Join-Path $appDataKeyconfigDir 'keymap_data'

if (Test-Path $keymapDataSource) {
    Copy-Item -Path $keymapDataSource -Destination $keymapDataDestination -Recurse -Force
    if ($portableKeyconfigDir) { Copy-Item -Path $keymapDataSource -Destination (Join-Path $portableKeyconfigDir 'keymap_data') -Recurse -Force }
    Write-Host "Copied keymap_data to AppData and portable directory"
} else {
    Write-Warning "keymap_data folder not found in $keyconfigDir"
}

# Blender���Ǘ��Ҍ����ŋN��
Write-Host "Step 7: Launching Blender..."
try {
    Start-Process -FilePath $blenderExe -Verb RunAs
} catch {
    Write-Host "Blender�̋N���Ɏ��s���܂���: $($_.Exception.Message)"
    Read-Host "Press Enter to exit"
    exit
}

# �������b�Z�[�W
[System.Windows.Forms.MessageBox]::Show("Configuration completed successfully!\nPlease verify the settings in Blender.", "Maya Config Installer", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)