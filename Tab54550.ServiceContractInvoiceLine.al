table 54550 "Service Contract Invoice Line"
{
    Caption = 'Service Contract Invoice Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Contract Line No."; Integer)
        {
            Caption = 'Contract Line No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Service Item No."; Code[20])
        {
            Caption = 'Service Item No.';
            TableRelation = "Service Item";
        }
        field(5; Description; Text[300])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(6; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF ("Item No." = FILTER(<> '')) "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item No."))
            ELSE
            "Unit of Measure";
        }
        field(7; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item WHERE(Type = CONST(Inventory));
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(9; "Response Time (Hours"; Decimal)
        {
            Caption = 'Response Time (Hours';
            DataClassification = ToBeClassified;
        }
        field(10; "Contract Line Cost"; Decimal)
        {
            Caption = 'Contract Line Cost';
            DataClassification = ToBeClassified;
        }
        field(11; "Contract Line Amount"; Decimal)
        {
            Caption = 'Contract Line Amount';
            DataClassification = ToBeClassified;
        }
        field(12; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            DataClassification = ToBeClassified;
        }
        field(13; Profit; Decimal)
        {
            Caption = 'Profit';
            DataClassification = ToBeClassified;
        }
        field(14; "Invoice Start Date"; Date)
        {
            Caption = 'Invoice Start Date';
            DataClassification = ToBeClassified;
        }
        field(15; "Invoice End Date"; Date)
        {
            Caption = 'Invoice End Date';
            DataClassification = ToBeClassified;
        }
        field(16; "Percentage of Contract Amount"; Decimal)
        {
            Caption = 'Percentage of Contract Amount';
            DataClassification = ToBeClassified;
        }
        field(17; "Line Cost"; Decimal)
        {
            Caption = 'Line Cost';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "Invoice No.", "Contract Line No.")
        {
            Clustered = true;
        }
    }
}
