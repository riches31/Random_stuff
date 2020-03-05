$ResourceGroup = 'EnterYourHere'
$AutomationAccountName = 'EnterYourHere'
$HybridWorkerGroup = 'EnterYourHere'
$Parameters =@{"Param1"="EnterYourHere";"Param2"="EnterYourHere"}


$Job = Start-AzAutomationRunbook -AutomationAccountName $AutomationAccountName -Name "EnterYourRunbooknameHere" -ResourceGroupName $ResourceGroup -Parameters $Parameters -RunOn $HybridWorkerGroup
$Job | Get-AzAutomationJob -ResourceGroupName $ResourceGroup -AutomationAccountName $AutomationAccountName
($Job | Get-AzAutomationJobOutput).Summary