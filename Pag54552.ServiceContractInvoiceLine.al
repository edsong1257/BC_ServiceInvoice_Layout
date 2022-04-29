page 54552 ServiceContractInvoiceLine
{
    ApplicationArea = All;
    Caption = 'Service Contract Invoice Line';
    PageType = List;
    SourceTable = "Service Contract Invoice Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Invoice No."; Rec."Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                    ApplicationArea = All;
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ToolTip = 'Specifies the value of the Contract No. field.';
                    ApplicationArea = All;
                }
                field("Contract Line No."; Rec."Contract Line No.")
                {
                    ToolTip = 'Specifies the value of the Contract Line No. field.';
                    ApplicationArea = All;
                }
                field("Service Item No."; Rec."Service Item No.")
                {
                    ToolTip = 'Specifies the value of the Service Item No. field.';
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                    ApplicationArea = All;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                    ApplicationArea = All;
                }
                field("Line Cost"; Rec."Line Cost")
                {
                    ToolTip = 'Specifies the value of the Line Cost field.';
                    ApplicationArea = All;
                }
                field("Percentage of Contract Amount"; Rec."Percentage of Contract Amount")
                {
                    ToolTip = 'Specifies the value of the Percentage of Contract Amount field.';
                    ApplicationArea = All;
                }
                field("Invoice Start Date"; Rec."Invoice Start Date")
                {
                    ToolTip = 'Specifies the value of the Invoice Start Date field.';
                    ApplicationArea = All;
                }
                field("Invoice End Date"; Rec."Invoice End Date")
                {
                    ToolTip = 'Specifies the value of the Invoice End Date field.';
                    ApplicationArea = All;
                }
                field("Contract Line Cost"; Rec."Contract Line Cost")
                {
                    ToolTip = 'Specifies the value of the Contract Line Cost field.';
                    ApplicationArea = All;
                }
                field("Contract Line Amount"; Rec."Contract Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                    ApplicationArea = All;
                }
                field(Profit; Rec.Profit)
                {
                    ToolTip = 'Specifies the value of the Profit field.';
                    ApplicationArea = All;
                }
                field("Response Time (Hours"; Rec."Response Time (Hours")
                {
                    ToolTip = 'Specifies the value of the Response Time (Hours field.';
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
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
}
