page 54551 ServiceDocumentRegester
{
    ApplicationArea = All;
    Caption = 'Service Document Regester';
    PageType = List;
    SourceTable = "Service Document Register";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Destination Document No."; Rec."Destination Document No.")
                {
                    ToolTip = 'Specifies the number of the invoice or credit memo, based on the contents of the Destination Document Type field.';
                    ApplicationArea = All;
                }
                field("Destination Document Type"; Rec."Destination Document Type")
                {
                    ToolTip = 'Specifies the type of document created from the service order or contract specified in the Source Document No.';
                    ApplicationArea = All;
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ToolTip = 'Specifies the number of the service order or service contract.';
                    ApplicationArea = All;
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ToolTip = 'Specifies the value of the Source Document Type field.';
                    ApplicationArea = All;
                }
                field("Service Contract Invoice Lines"; Rec."ServiceContractInvoiceLines")
                {
                    ToolTip = 'Specifies numbers of records exsit in Service Contract Invoice Lines table.';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            group("&Action")
            {
                Caption = '&Action';
                Image = Action;
                action("Add To Invoice Line")
                {
                    Promoted = true;
                    ApplicationArea = All;
                    Image = AddAction;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        selectedRecords: Record "Service Document Register";
                        recordCount: Integer;
                    begin
                        CurrPage.SetSelectionFilter(selectedRecords);
                        recordCount := selectedRecords.Count;
                        if selectedRecords.FindFirst then begin
                            repeat
                                InsertSCILines.CreateServiceContractInvLine(selectedRecords, true);
                            until selectedRecords.Next() = 0;
                            Message('%1 contract(s) have been added to the invoice', recordCount);
                        end;
                    end;

                }
            }
            group("&Document")
            {
                Image = Document;
                action(Card)
                {
                    ApplicationArea = Service;
                    Caption = 'Card';
                    Image = EditLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View or change detailed information about the record on the document or journal line.';

                    trigger OnAction()
                    begin
                        case Rec."Destination Document Type" of
                            Rec."Destination Document Type"::Invoice:
                                begin
                                    ServHeader.Get(ServHeader."Document Type"::Invoice, Rec."Destination Document No.");
                                    PAGE.Run(PAGE::"Service Invoice", ServHeader);
                                end;
                            Rec."Destination Document Type"::"Credit Memo":
                                begin
                                    ServHeader.Get(ServHeader."Document Type"::"Credit Memo", Rec."Destination Document No.");
                                    PAGE.Run(PAGE::"Service Credit Memo", ServHeader);
                                end;
                            Rec."Destination Document Type"::"Posted Invoice":
                                begin
                                    ServInvHeader.Get(Rec."Destination Document No.");
                                    PAGE.Run(PAGE::"Posted Service Invoice", ServInvHeader);
                                end;
                            Rec."Destination Document Type"::"Posted Credit Memo":
                                begin
                                    ServCrMemoHeader.Get(Rec."Destination Document No.");
                                    PAGE.Run(PAGE::"Posted Service Credit Memo", ServCrMemoHeader);
                                end;
                        end;
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
                    RunPageLink = "Invoice No." = field("Destination Document No.");
                    ToolTip = 'View or change detailed information about the record on the document or journal line.';
                }
                action("Contract Invoice Lines Table")
                {
                    ApplicationArea = Service;
                    Caption = 'Contract Invoice Lines Table';
                    Image = EditLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    trigger OnAction()
                    begin
                        PAGE.Run(PAGE::ServiceContractInvoiceLine);
                    end;
                }
            }
        }
    }
    var
        InsertSCILines: codeunit InsertSCILines;
        ServHeader: Record "Service Header";
        ServInvHeader: Record "Service Invoice Header";
        ServCrMemoHeader: Record "Service Cr.Memo Header";
}
