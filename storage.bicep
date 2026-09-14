resource mysa 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: saname
  location: RGLocation
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource mypip 'Microsoft.Network/publicIPAddresses@2024-07-01' = {
  name: 'mypip1'
  location: RGLocation
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

@allowed(
  [
    'SwedenCentral'
    'NorwayEast'
  ]
)
param RGLocation string = 'SwedenCentral'

var saname = 'sa${uniqueString(resourceGroup().id)}'
