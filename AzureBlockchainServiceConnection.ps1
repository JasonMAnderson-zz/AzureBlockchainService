#  Establishes a connection to the Azure Blockchain Service member
#  Once executed, all consortium management powershell commands within the session can use $ContractConnection as input for your member's connection information 

$global:config = @{
    FromNode = @{
        Endpoint = "https://<YourBlockchainMemberName>.blockchain.azure.com:3200/<YourAPIKey>"
        AccountAddress = "<YourBlockchainMemberAccountAddress>"
        AccountPassword = "<YourAccountPassword>"
    }
    Network = @{
        RootContractAddress = "<YourRootContractAddress>"
    }
}

$global:InformationPreference="Continue";

$Connection=New-Web3Connection -RemoteRPCEndpoint $config.FromNode.Endpoint

$global:MemberAccount=Import-Web3Account -ManagedAccountAddress $config.FromNode.AccountAddress -ManagedAccountPassword $config.FromNode.AccountPassword
$global:ContractConnection=Import-ConsortiumManagementContracts -RootContractAddress $config.Network.RootContractAddress -Web3Client $Connection

#  Optional, but gives confirmation of successful connection as well as member and pending inivitation information

$ContractConnection | Get-BlockchainMember
$ContractConnection | Get-BlockchainMemberInvitation
