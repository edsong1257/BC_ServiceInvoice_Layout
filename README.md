
# BC_ServiceInvoice_Layout_Solution

This plugin allows user to print aggregated service contract lines in service invoice.

### The value of this plugin
When you create serivce invoice for the service contract, the system will break down the full amount into service invoice lines in order to defer the revenue across invoice period. However it is not practical to show all lines in the service invoice document, therefore I created a plugin to aggregate service invoice lines so it can be shown in a more tidy way.
## Process
![Plugin Process](https://github.com/edsong1257/BC_ServiceInvoice_Layout/blob/main/img/Process.png)

## Features
Blows are features in corresponding page.
#### Service Document Regester
| Action | Description                |
| :-------- | :------------------------- |
| Add To Inovice Line | Manually adding service contract lines of selected service invoice to posted service contract invoice.(for testing purpose.) |
|Card| Navigated to posted service invoice.|
|Service Contract Invoice Line|Change service contract invoice line information|
|Contract Invoice Line Table|Overview of all aggregated service contract invoice lines created by this plugin.|

#### Posted Service Invoice
- A grid which display aggregated service contract invocie lines.
- Print document for service contract invoice.
- Email service contract invoice document.


## Configuration
### Change condition for create Service Contract Invoice Line
Procedure `CreateServiceContractInvLine` in code unit `Cod54550.InsertSCILines.al` is the code unit responsible for creating Service Contract Invoice Line.
#### Trigger condition.
```javascript
if Rec."Destination Document Type" = Rec."Destination Document Type"::"Posted Invoice" then
begin
...
    ServiceInvLine.SetRange("Document No.", Rec."Destination Document No.");
    ContractLine.SetRange("Contract Type", Rec."Source Document Type");
    ContractLine.SetRange("Contract No.", Rec."Source Document No.");
    ContractLine.SetRange("Service Item No.", '');
...
end
```
### Add layout for service contract invoice.
#### Upload layout
Go to **Custom Report Layouts** and create new RDLC layout for `Report 5911`
![Custom_Layout](https://github.com/edsong1257/BC_ServiceInvoice_Layout/blob/main/img/Custom%20layout%20selection.png)


#### Set as default layout
Go to **Report layout selection** then set the default layout for `Report 5911`
![Report_Layout_selection](https://github.com/edsong1257/BC_ServiceInvoice_Layout/blob/main/img/Report%20layout%20selection.png)

## Screenshots
### Before
![Beofre](https://github.com/edsong1257/BC_ServiceInvoice_Layout/blob/main/img/invoice_duration_before.png)
### After
![After](https://github.com/edsong1257/BC_ServiceInvoice_Layout/blob/main/img/invoice_duration_after.png)


## Known issue
- The invoice start date and inovice end date is wrong. The plugin can only retrieve the **next** invoice duration.
