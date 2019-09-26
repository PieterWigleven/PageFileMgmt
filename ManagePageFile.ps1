{
    "apiVersion": "2018-06-01",
    "type": "Microsoft.Compute/virtualMachines/extensions",
    "name": "virtualMachineName/config-app",
    "location": "[resourceGroup().location]",
    "dependsOn": [
        "[concat('Microsoft.Compute/virtualMachines/', variables('vmName'),copyindex())]",
        "[variables('musicstoresqlName')]"
    ],
    "tags": {
        "displayName": "config-app"
    },
    "properties": {
        "publisher": "Microsoft.Compute",
        "type": "CustomScriptExtension",
        "typeHandlerVersion": "1.9",
        "autoUpgradeMinorVersion": true,
        "settings": {
            "fileUris": [
                "https://raw.githubusercontent.com/pietermsft/PageFileMgmt/master/AdjustVirtualMemoryPagingFileSize.psm1"
            ],
            "timestamp":123456789
        },
        "protectedSettings": {
            "commandToExecute": "powershell -ExecutionPolicy Unrestricted; Import-Module AdjustVirtualMemoryPagingFileSize.psm1; Set-OSCVirtualMemory -InitialSize 15360 -MaximumSize 15360 -DriveLetter "D:""
            }
    }
}