$TotalHFCount = (Get-HotFix | Measure-Object).Count
$TotalHFCount

Get-HotFix | Select * | Out-GridView

Get-HotFix | Select * | Group-Object Description | Select Name,Count
