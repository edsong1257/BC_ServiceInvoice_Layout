tableextension 54550 ServiceDocumentRegester extends "Service Document Register"
{
    fields
    {
        field(54550; ServiceContractInvoiceLines; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Service Contract Invoice Line" where("Invoice No." = field("Destination Document No.")));
        }
    }
}
