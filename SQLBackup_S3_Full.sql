--Backup to S3 (Full backups)
$server = '.'
$database = 'Backupme'
$s3Bucket = 'backupsqlservers'
$backupPath = 'C:\Backup01\Full'
$region = 'us-west-2'
$timestamp = get-date -format yyyyMMddHHmmss
$fileName = "$database-$timestamp.bak"
$filePath = Join-Path $backupPath $fileName
Backup-SqlDatabase -ServerInstance $server -Database $database -BackupFile $filePath
Write-S3Object -BucketName $s3Bucket -File $filePath -Key $fileName -Region $region
Remove-Item $backupPath$database*.bak
