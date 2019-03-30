Import-Module PSWriteHTML -Force

$Time = Start-TimeLog
$ReportTitle = 'Test'
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName

New-HTML -TitleText $ReportTitle -UseCssLinks -UseJavaScriptLinks -FilePath "$PSScriptRoot\Example4.html" {
    New-HTMLTab -TabName 'Dashboard'  {
        New-HTMLContent -HeaderText "Groups" {
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable -Verbose
            }
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable -Verbose
            }
        }
        New-HTMLContent -HeaderText 'Test 2' {

        }
    }
    New-HTMLTab -TabName 'Something'  {

    }
}
Stop-TimeLog -Time $Time -Option OneLiner