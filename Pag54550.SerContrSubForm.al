page 54550 SerContrSubForm
{
    Caption = 'Invoice Contract Lines';
    PageType = ListPart;
    SourceTable = "Service Contract Invoice Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Service Item No."; Rec."Service Item No.")
                {
                    ToolTip = 'Specifies the value of the Service Item No. field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                    ApplicationArea = All;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                    ApplicationArea = All;
                }
                field("Contract Line Amount"; Rec."Contract Line Amount")
                {
                    ToolTip = 'Original contract line amount.';
                    ApplicationArea = All;
                }
                field("Percentage of Contract Amount"; Rec."Percentage of Contract Amount")
                {
                    ToolTip = 'Specifies the value of the Percentage of Contract Amount field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
