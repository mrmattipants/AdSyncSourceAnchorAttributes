# AdSyncSourceAnchorAttributes
PowerShell Script to Retrieve AdSync sourceAnchor Attributes associated with Hybrid AD User Accounts ("objectGUID", "mS-DS-ConsistencyGUID" & "ImmutableID").

<b><u>"Username" Parameter:</u></b>

The "Username" Parameter will retrieve/calculate all three Values ("objectGUID", "mS-DS-ConsistencyGUID" & "ImmutableID"), via On-Premises AD.

<code>Get-AdSyncSourceAnchorAttributes -Username \<Username\></code>

<i><b>NOTE</b>: The "Username" Parameter utilizes the "Get-AdUser" Cmdlet and is therefore Dependant on the "ActiveDirectory" PowerShell Module.</i>

<b><u>"ObjectGuid" Parameter:</u></b>

The "ObjectGuid" Parameter will retrieve/calculate the "mS-DS-ConsistencyGUID" & "ImmutableID" Values.

<code>Get-AdSyncSourceAnchorAttributes -ObjectGuid \<objectGUID\></code>

<b><u>"MsDsConsistencyGuid" Parameter:</u></b>

The "MsDsConsistencyGuid" Parameter will retrieve/calculate the "objectGUID" & "ImmutableID" Values.

<code>Get-AdSyncSourceAnchorAttributes -msDsConsistencyGuid \<mS-DS-ConsistencyGUID\></code>

<b><u>"ImmutableId" Parameter:</u></b>

The "ImmutableId" Parameter will retrieve/calculate the "objectGUID" & "mS-DS-ConsistencyGUID" Values.

<code>Get-AdSyncSourceAnchorAttributes -ImmutableId \<onPremisesImmutableID\></code>

<b>Get-AdSyncSourceAnchorAttributes (Format-Table):</b>
<center><img src="https://i.imgur.com/vsrlxw3_d.webp?maxwidth=760&fidelity=grand"/></center>

<b>Get-AdSyncSourceAnchorAttributes (Format-List):</b>
<center><img src="https://i.imgur.com/9iQaRjM_d.webp?maxwidth=760&fidelity=grand"/></center>



<b>Azure/Entra AD - On-Premises AD Attributes:</b>
<center><img src="https://i.imgur.com/rJILOxQ_d.webp?maxwidth=760&fidelity=grand"/></center>

<b>On-Premises AD - objectGuid Attribute:</b>
<center><img src="https://i.imgur.com/7UHqdh0_d.webp?maxwidth=760&fidelity=grand"/></center>

<b>On-Premises AD - ms-DS-ConsistencyGuid Attribute:</b>
<center><img src="https://i.imgur.com/a0prFv0_d.webp?maxwidth=760&fidelity=grand"/></center>
