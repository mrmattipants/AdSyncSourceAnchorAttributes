function Get-AdSyncSourceAnchorAttributes {
    param(
        [string]$Username,
        [string]$ObjectGuid,
        [string]$MsDsConsistencyGuid,
        [string]$ImmutableId
    )

    If ($Username) {

        $UserObject = Get-AdUser -Identity $Username -Properties objectGUID,mS-DS-ConsistencyGuid,msDS-ExternalDirectoryObjectId
        $MsDsConsistencyGuid = ($UserObject."mS-DS-ConsistencyGuid" | % ToString X2) -join ' '

    }

    If ($ObjectGuid) {

        $ImmutableId = [system.convert]::ToBase64String(([GUID]$ObjectGuid).ToByteArray())
        $MsDsConsistencyGuid = ([system.convert]::FromBase64String($ImmutableId) | % ToString X2) -join ' '

    } ElseIf ($MsDsConsistencyGuid) {
        
        $ImmutableId = [system.convert]::ToBase64String([byte[]] (-split (($MsDsConsistencyGuid -replace " ", "") -replace '..', '0x$& ')))
        $ObjectGuid = $guid = [GUID]([system.convert]::FromBase64String($ImmutableId))
       

    } ElseIf ($ImmutableId) {

        $ObjectGuid = [GUID]([system.convert]::FromBase64String($ImmutableId))
        $MsDsConsistencyGuid = (([GUID]$ObjectGuid).ToByteArray() | % ToString X2) -join ' '

    } Else {

        EXIT

    }

    $Properties = [PSCustomObject]@{
        ObjectGuid          = $ObjectGuid
        MsDsConsistencyGuid = $MsDsConsistencyGuid
        ImmutableId         = $ImmutableId
    }

    return $Properties

}

# ObjectGUID Property
#$Output = Get-AdSyncSourceAnchorAttributes -ObjectGuid "338a5711-1e30-4fa1-843a-88da41d144e4"
#$Output | Format-List

# mS-DS-ConsistencyGuid Property
#$Output = Get-AdSyncSourceAnchorAttributes -MsDsConsistencyGuid "11 57 8A 33 30 1E A1 4F 84 3A 88 DA 41 D1 44 E4"
#$Output | Format-List

# On-PremisesImmutableId Property
#$Output = Get-AdSyncSourceAnchorAttributes -ImmutableId "EVeKMzAeoU+EOojaQdFE5A=="
#$Output | Format-List
