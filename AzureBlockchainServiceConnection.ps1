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

$Global:InformationPreference="Continue";

$Connection=New-Web3Connection -RemoteRPCEndpoint $config.FromNode.Endpoint

$global:MemberAccount=Import-Web3Account -ManagedAccountAddress $config.FromNode.AccountAddress -ManagedAccountPassword $config.FromNode.AccountPassword
$global:ContractConnection=Import-ConsortiumManagementContracts -RootContractAddress $config.Network.RootContractAddress -Web3Client $Connection

$ContractConnection | Get-BlockchainMember
$ContractConnection | Get-BlockchainMemberInvitation