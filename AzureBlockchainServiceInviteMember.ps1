$ContractConnection | New-BlockchainMemberInvitation -SubscriptionId <AzureSubscriptionID> -Role USER -Web3Account $MemberAccount
$ContractConnection | Get-BlockchainMember
$ContractConnection | Get-BlockchainMemberInvitation