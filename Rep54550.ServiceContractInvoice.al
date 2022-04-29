report 54550 "Service Contract Invoice"
{
    ApplicationArea = All;
    Caption = 'Service Contract Invoice';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(ServiceInvoiceHeader; "Service Invoice Header")
        {
            RequestFilterFields = "No.";
            column(ActualResponseTimeHours; "Actual Response Time (Hours)")
            {
            }
            column(Address; Address)
            {
            }
            column(AmountIncludingVAT; "Amount Including VAT")
            {
            }
            column(BilltoAddress; "Bill-to Address")
            {
            }
            column(BilltoCity; "Bill-to City")
            {
            }
            column(BilltoContact; "Bill-to Contact")
            {
            }
            column(BilltoCountryRegionCode; "Bill-to Country/Region Code")
            {
            }
            column(BilltoCounty; "Bill-to County")
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(BilltoName; "Bill-to Name")
            {
            }
            column(BilltoPostCode; "Bill-to Post Code")
            {
            }
            column(City; City)
            {
            }
            column(Comment; Comment)
            {
            }
            column(ContactName; "Contact Name")
            {
            }
            column(ContactNo; "Contact No.")
            {
            }
            column(ContractNo; "Contract No.")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(County; County)
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(Description; Description)
            {
            }
            column(DueDate; Format("Due Date", 0, '<Day,2><Filler Character, >. <Month Text,3> <Year4>'))
            {
            }
            column(InvoiceDiscCode; "Invoice Disc. Code")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(Name; Name)
            {
            }
            column(No; "No.")
            {
            }
            column(PaymentDiscount; "Payment Discount %")
            {
            }
            column(PaymentMethodCode; "Payment Method Code")
            {
            }
            column(PaymentReference; "Payment Reference")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }

            column(PostCode; "Post Code")
            {
            }
            column(PostingDate; Format("Posting Date", 0, '<Day,2><Filler Character, >. <Month Text,3> <Year4>'))
            {
            }
            column(PostingDescription; "Posting Description")
            {
            }
            column(PostingNo; "Posting No.")
            {
            }
            column(PreAssignedNo; "Pre-Assigned No.")
            {
            }
            column(PricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(Priority; Priority)
            {
            }
            column(ResponseDate; Format("Response Date", 0, '<Day,2><Filler Character, >. <Month Text,3> <Year4>'))
            {
            }
            column(ResponseTime; "Response Time")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(ServiceOrderType; "Service Order Type")
            {
            }
            column(ServiceTimeHours; "Service Time (Hours)")
            {
            }
            column(ServiceZoneCode; "Service Zone Code")
            {
            }
            column(ShiptoAddress; "Ship-to Address")
            {
            }
            column(ShiptoCity; "Ship-to City")
            {
            }
            column(ShiptoCode; "Ship-to Code")
            {
            }
            column(ShiptoContact; "Ship-to Contact")
            {
            }
            column(ShiptoCountryRegionCode; "Ship-to Country/Region Code")
            {
            }
            column(ShiptoCounty; "Ship-to County")
            {
            }
            column(ShiptoEMail; "Ship-to E-Mail")
            {
            }
            column(ShiptoName; "Ship-to Name")
            {
            }
            column(ShiptoPhone; "Ship-to Phone")
            {
            }
            column(ShiptoPostCode; "Ship-to Post Code")
            {
            }
            column(ShippingNo; "Shipping No.")
            {
            }
            column(SourceCode; "Source Code")
            {
            }
            column(StartingDate; Format("Starting Date", 0, '<Day,2><Filler Character, >. <Month Text,3> <Year4>'))
            {
            }
            column(TransactionType; "Transaction Type")
            {
            }
            column(TransportMethod; "Transport Method")
            {
            }
            column(VATBusPostingGroup; "VAT Bus. Posting Group")
            {
            }
            column(YourReference; "Your Reference")
            {
            }
            column(Amount; Amount)
            {
            }
            column(BalAccountNo; "Bal. Account No.")
            {
            }
            column(DocumentDate; Format("Document Date", 0, '<Day,2><Filler Character, >. <Month Text,3> <Year4>'))
            {
            }
            dataitem(ServiceContractInvoiceLine; "Service Contract Invoice Line")
            {
                DataItemLink = "Invoice No." = FIELD("No.");
                DataItemLinkReference = ServiceInvoiceHeader;
                DataItemTableView = SORTING("Invoice No.", "Contract Line No.");

                column(ContractLineNo; "Contract Line No.")
                {
                }
                column(Line_ContractNo; "Contract No.")
                {
                }
                column(Line_Description; Description)
                {
                }
                column(InvoiceNo; "Invoice No.")
                {
                }
                column(ItemNo; "Item No.")
                {
                }
                column(Contract_Line_Amount; "Contract Line Amount")
                {
                }
                column(Contract_Line_Cost; "Contract Line Cost")
                {
                }
                column(Line_Cost; "Line Cost")
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }
                column(Profit; Profit)
                {
                }
                column(Percentage_of_Contract_Amount; "Percentage of Contract Amount")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(ResponseTimeHours; "Response Time (Hours")
                {
                }
                column(ServiceItemNo; "Service Item No.")
                {
                }
                column(UnitofMeasureCode; "Unit of Measure Code")
                {
                }
                column(Invoice_Start_Date; Format("Invoice Start Date", 0, '<Day,2><Filler Character, >. <Month Text,3> <Year4>'))
                {
                }
                column(Invoice_End_Date; Format("Invoice End Date", 0, '<Day,2><Filler Character, >. <Month Text,3> <Year4>'))
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
