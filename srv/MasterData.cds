using { com.satInfoTech.ElectronicsApp as db } from '../db/MasterData/schema';

service electronicsapp {
     entity BusinessPartner as projection on db.BusinessPartner;
     entity Store as projection on db.Store;
     entity State as projection on db.State;
     entity Product as projection on db.Product;
     entity StockData as projection on db.StockData;
}
annotate electronicsapp.BusinessPartner with {
    name @assert.format: '^[a-zA-Z]{2,}$';
    pincode   @assert.format: '^(\d{4}|\d{6})$';
};
annotate electronicsapp.BusinessPartner with @odata.draft.enabled;
annotate electronicsapp.Store with @odata.draft.enabled;
annotate electronicsapp.Product with @odata.draft.enabled;
annotate electronicsapp.StockData with @odata.draft.enabled;
annotate electronicsapp.BusinessPartner with @(
    UI.LineItem: [
        {
            $Type:'UI.DataField',
            Value:BusinessPartnerID
        },
        {
            $Type:'UI.DataField',
            Value:name
        },
        {
            $Type:'UI.DataField',
            Value:address1
        },
        {
            $Type:'UI.DataField',
            Value:address2
        },
        {
            $Type:'UI.DataField',
            Value:pincode
        },
        {
            $Type:'UI.DataField',
            Label:'state',
            Value:state
        },
        {
            Value: is_vendor
        },
         {
            Value: is_customer
        },

    ],
    UI.SelectionFields:[BusinessPartnerID,name]
);
annotate electronicsapp.BusinessPartner with @(
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type:'UI.DataField',
            Value:BusinessPartnerID,
        },
            {
                $Type : 'UI.DataField',
                Value : name,
            },

            {
                $Type : 'UI.DataField',
                Value : address1,
            },
            {
                $Type : 'UI.DataField',
                Value : address2,
            },
            {
                $Type : 'UI.DataField',
                Value : pincode,
            },
            {
            $Type:'UI.DataField',
            Label:'state',
            Value:state
        },
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessPartnerInfoFacet',
            Label : 'businesspartner Information',
            Target : '@UI.FieldGroup#BusinessPartnerInformation',
        },
    ]
    
);
annotate electronicsapp.Store with @(
    UI.LineItem: [
        {
            $Type:'UI.DataField',
            Value:storeid
        },
        {
            $Type:'UI.DataField',
            Value:Name
        },
        {
            $Type:'UI.DataField',
            Value:address1
        },
        {
            $Type:'UI.DataField',
            Value:address2
        },
        {
            $Type:'UI.DataField',
            Value:pincode
        },
        {
            $Type:'UI.DataField',
            Label:'state',
            Value:state
        },
    ],
    UI.SelectionFields:[storeid,Name]
);

annotate electronicsapp.Store with @(
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type:'UI.DataField',
                Value:storeid
            },
            {
                $Type : 'UI.DataField',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Value : address1,
            },
            {
                $Type : 'UI.DataField',
                Value : address2,
            },
            {
                $Type : 'UI.DataField',
                Value : pincode,
            },
            {
            $Type:'UI.DataField',
            Label:'state',
            Value:state
        },
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreInfoFacet',
            Label : 'store Information',
            Target : '@UI.FieldGroup#StoreInformation',
        },
    ]
);
annotate electronicsapp.State with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : code
        },
        {
            $Type : 'UI.DataField',
            Value : description
        }
    ],
);
annotate electronicsapp.BusinessPartner with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'States',
            CollectionPath: 'State',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: state,
                    ValueListProperty: 'code'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    )
};
annotate electronicsapp.Store with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'States',
            CollectionPath: 'State',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: state,
                    ValueListProperty: 'code'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    )
};
annotate electronicsapp.Product with @(
    UI.LineItem: [
        {
            $Type:'UI.DataField',
            Value:productid
        },
        {
            $Type:'UI.DataField',
            Value:productname
        },
        {
            $Type:'UI.DataField',
            Value:productimage
        },
        {
            $Type:'UI.DataField',
            Value:productcostprice
        },
        {
            $Type:'UI.DataField',
            Value:productsellingprice
        },

    ],
    UI.SelectionFields:[productid,productname]
);
annotate electronicsapp.Product with @(
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type:'UI.DataField',
            Value:productid,
        },
            {
                $Type : 'UI.DataField',
                Value : productname,
            },

            {
                $Type : 'UI.DataField',
                Value : productimage,
            },
            {
                $Type : 'UI.DataField',
                Value : productcostprice,
            },
            {
                $Type : 'UI.DataField',
                Value : productsellingprice,
            },
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'product Information',
            Target : '@UI.FieldGroup#ProductInformation',
        },
    ]
    
);
annotate electronicsapp.StockData with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store
        },
        {
            $Type : 'UI.DataField',
             Value : product
        },
        {
            $Type : 'UI.DataField',
            Value : stockQty
        }
    ],
);
annotate electronicsapp.StockData with @(
    UI.FieldGroup #StockDataInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                 Value : store_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : product_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : stockQty,
            },
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StockDataInfoFacet',
            Label : 'Stock Data Information',
            Target : '@UI.FieldGroup#StockDataInformation',
        },
    ]
);
