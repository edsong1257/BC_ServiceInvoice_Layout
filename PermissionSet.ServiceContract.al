permissionset 54550 ServiceContract
{
    Assignable = true;
    Caption = 'ServiceContract', MaxLength = 30;
    Permissions =
        table "Service Contract Invoice Line" = X,
        tabledata "Service Contract Invoice Line" = RMID,
        codeunit InsertSCILines = X,
        page ServiceContractInvoiceLine = X,
        page ServiceDocumentRegester = X,
        page SerContrSubForm = X,
        report "Service Contract Invoice" = X;
}
