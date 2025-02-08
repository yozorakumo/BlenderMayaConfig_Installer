# �����p�̏ؖ������쐬
$cert = New-SelfSignedCertificate `
        -Subject "CN=PowerShell�X�N���v�g�����p�ؖ���" `
        -KeyAlgorithm RSA `
        -KeyLength 2048 `
        -Type CodeSigningCert `
        -CertStoreLocation Cert:\CurrentUser\My\ `
        -NotAfter ([datetime]"2099/01/01")
# �M���ς݂̃��[�g�Ƃ��Ďg�p
Move-Item "Cert:\CurrentUser\My\$($cert.Thumbprint)" Cert:\CurrentUser\Root
 
# �ؖ����ւ̎Q�Ƃ��擾
$rootcert = @(Get-ChildItem cert:\CurrentUser\Root -CodeSigningCert)[0]
# �X�N���v�g�ɏ���
Set-AuthenticodeSignature C:\BlenderMayaConfigInstall.ps1 $rootcert
