pageextension 54550 ServiceContractLineList extends "Posted Service Invoice"
{
    layout
    {
        addafter(Invoicing)
        {
            part("Invoice Contract Lines"; SerContrSubForm)
            {
                ApplicationArea = Service;
                SubPageLink = "Invoice No." = FIELD("No.");
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action("PrintCustom")
            {
                ApplicationArea = Service;
                Caption = 'Print Contract Inv.';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Prepare to print invoice for service contract';

                trigger OnAction()
                var
                    InvHeader: Record "Service Invoice Header";
                    InvReport: Report "Service Contract Invoice";
                begin
                    Clear(InvHeader);
                    InvHeader := Rec;
                    InvHeader.SetRecFilter();
                    InvReport.SetTableView(InvHeader);
                    InvReport.RunModal();
                end;
            }
            action(EmailEdit)
            {
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Send Contract Inv.';
                Ellipsis = true;
                PromotedIsBig = true;
                Image = Email;
                ApplicationArea = All;
                ToolTip = 'send invoice for service contract';

                trigger OnAction()
                begin
                    EmailEdit(Rec."No.", Rec."Bill-to Customer No.");
                end;
            }
            action("Related Contract Invoice Lines")
            {
                ApplicationArea = Service;
                Caption = 'Related Contract Invoice Lines';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page ServiceContractInvoiceLine;
                RunPageLink = "Invoice No." = field("No.");
                ToolTip = 'View or change detailed information about the record on the document or journal line.';
            }
        }
    }
    local procedure EmailEdit(InvoiceNo: Code[20]; Customer: code[20]): Text
    var
        tmpBlob: Codeunit "Temp Blob";
        cnv64: Codeunit "Base64 Convert";
        InStr: InStream;
        OutStr: OutStream;
        txtB64: Text;
        format: ReportFormat;
        email: Codeunit Email;
        emailMsg: Codeunit "Email Message";
        recRef: RecordRef;
        ServiceInvoice: Record "Service Invoice Header";
        Recipients: Record "customer";
        Title: text[100];
        FileName: text[100];

    begin
        ServiceInvoice.Get(InvoiceNo);
        ServiceInvoice.SetRange("No.", InvoiceNo);
        Recipients.get(Customer);
        Recipients.SetRange("No.", Customer);
        recRef.GetTable(ServiceInvoice);
        tmpBlob.CreateOutStream(OutStr);
        Title := 'Service Invoice ' + ServiceInvoice."No.";
        FileName := 'Service Invoice ' + ServiceInvoice."No." + '.pdf';
        if Report.SaveAs(Report::"Service Contract Invoice", '', format::Pdf, OutStr, recRef) then begin
            tmpBlob.CreateInStream(InStr);
            txtB64 := cnv64.ToBase64(InStr, true);
            emailMsg.Create(Recipients."E-Mail", Title, '');
            emailMsg.AddAttachment(FileName, 'application/pdf', txtB64);
            email.OpenInEditor(emailMsg);
        end;
    end;
}