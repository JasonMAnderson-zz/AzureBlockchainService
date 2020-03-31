#  This script provides a quick way to invite a member, providing feedback after invitiation of the invite status.
#  Note: You must run the AzureBlockchainServiceConnection.ps1 script prior to running this script, as it establishes the variables below.

$ContractConnection | New-BlockchainMemberInvitation -SubscriptionId <AzureSubscriptionID> -Role USER -Web3Account $MemberAccount
$ContractConnection | Get-BlockchainMember
$ContractConnection | Get-BlockchainMemberInvitation
