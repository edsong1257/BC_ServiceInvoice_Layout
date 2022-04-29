codeunit 54550 InsertSCILines
{
    TableNo = "Service Document Register";

    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Document Register", 'OnAfterInsertEvent', '', true, true)]
    procedure CreateServiceContractInvLine(Rec: Record "Service Document Register"; Runtrigger: Boolean)
    var
        ServiceContrInvLine: Record "Service Contract Invoice Line";
        ServiceInvLine: Record "Service Invoice Line";
        InvLineField: FieldRef;
        ContractLine: Record "Service Contract Line";
        ContractHeader: Record "Service Contract Header";
        InvAmount: Decimal;
    begin
        if Rec."Destination Document Type" = Rec."Destination Document Type"::"Posted Invoice" then begin
            ContractLine.Reset();
            ContractHeader.Reset();
            ServiceInvLine.Reset();
            ServiceInvLine.SetRange("Document No.", Rec."Destination Document No.");
            ContractLine.SetRange("Contract Type", Rec."Source Document Type");
            ContractLine.SetRange("Contract No.", Rec."Source Document No.");
            ContractLine.SetRange("Service Item No.", '');
            ContractHeader.Get(ContractHeader."Contract Type"::Contract, Rec."Source Document No.");
            ServiceInvLine.CalcSums("Amount");
            InvAmount := ServiceInvLine.Amount;
            if ContractLine.FindSet then
                repeat
                    ServiceContrInvLine.Init();
                    ServiceContrInvLine."Contract No." := ContractLine."Contract No.";
                    ServiceContrInvLine."Contract Line No." := ContractLine."Line No.";
                    ServiceContrInvLine."Service Item No." := ContractLine."Service Item No.";
                    ServiceContrInvLine.Description := ContractLine.Description;
                    ServiceContrInvLine."Invoice No." := Rec."Destination Document No.";
                    ServiceContrInvLine."Item No." := ContractLine."Item No.";
                    ServiceContrInvLine."Invoice Start Date" := ContractHeader."Next Invoice Period Start";
                    ServiceContrInvLine."Invoice End Date" := ContractHeader."Next Invoice Period End";
                    ServiceContrInvLine.Quantity := 1;
                    ServiceContrInvLine."Unit of Measure Code" := ContractLine."Unit of Measure Code";
                    ServiceContrInvLine."Response Time (Hours" := ContractLine."Response Time (Hours)";
                    ServiceContrInvLine."Contract Line Amount" := ContractLine."Line Amount";
                    ServiceContrInvLine."Percentage of Contract Amount" := CalculateRatio(ContractHeader."Amount per Period", InvAmount);
                    ServiceContrInvLine."Line Amount" := ServiceContrInvLine."Contract Line Amount" * ServiceContrInvLine."Percentage of Contract Amount";
                    ServiceContrInvLine."Line Cost" := ServiceContrInvLine."Contract Line Cost" * ServiceContrInvLine."Percentage of Contract Amount";
                    ServiceContrInvLine."Contract Line Cost" := ContractLine."Line Cost";
                    ServiceContrInvLine."Contract Line Amount" := ContractLine."Line Amount";
                    ServiceContrInvLine.Profit := ContractLine.Profit * ServiceContrInvLine."Percentage of Contract Amount";
                    ServiceContrInvLine.Insert(true);
                until ContractLine.Next() = 0;
        end;


    end;

    local procedure CalculateRatio(ContractAmount: Decimal; InvoiceAmount: Decimal) Ratio: Decimal
    begin
        if InvoiceAmount <> 0 then
            Ratio := InvoiceAmount / ContractAmount
        else
            Ratio := 1
    end;
}
