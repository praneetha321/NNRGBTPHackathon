using { com.satInfoTech.ElectronicsApp as db } from '../db/MasterData/schema';

service electronicsapp {
     entity BusinessPartner as projection on db.BusinessPartner;
     entity Store as projection on db.Store;
     entity State as projection on db.State;
     entity Product as projection on db.Product;
     entity StockData as projection on db.StockData;
     entity PurchaseOrder as projection on db.PurchaseOrder;
     entity Sale as projection on db.Sale;
}
annotate electronicsapp.BusinessPartner with {
    name @assert.format: '^[a-zA-Z]{2,}$';
    pincode   @assert.format: '^(\d{4}|\d{6})$';
    GSTIN_Number @assert.format: '^(\d{2}[A-Z]{5}\d{4}[A-Z]{1}\d{1})$';
};
annotate electronicsapp.BusinessPartner with @odata.draft.enabled;
annotate electronicsapp.Store with @odata.draft.enabled;  
annotate electronicsapp.Product with @odata.draft.enabled;
annotate electronicsapp.StockData with @odata.draft.enabled;
annotate electronicsapp.PurchaseOrder with @odata.draft.enabled;
annotate electronicsapp.Sale with @odata.draft.enabled;

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
            $Type:'UI.DataField',
            Value:Is_gstn_registered
        },
        {
            $Type:'UI.DataField',
            Value:GSTIN_Number
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
            Value:Is_gstn_registered,
        },
        {
            $Type:'UI.DataField',
            Value:GSTIN_Number,
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
            Value:ProductPictureURL
        },
        {
                $Type : 'UI.DataField',
                Value : ProductPicture,
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
                Value : ProductPicture,
            },

            {
                $Type : 'UI.DataField',
                Value :ProductPictureURL,
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
            Value : store_ID
        },
        {
            $Type : 'UI.DataField',
             Value : product_ID
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
annotate electronicsapp.PurchaseOrder.items with @( 
    UI.LineItem: [
        {
            Value: product_id,
        },
        {
            Value: qty,
        },
        {
            Value: price,
        },
        {
            Value: store_id,
        },
    ],
    UI.FieldGroup #PurchaseOrderItem: {
        $Type: 'UI.FieldGroupType',
        Data: [
            { 
                $Type: 'UI.DataField', 
                Value: product_id,
                },
            { 
                $Type: 'UI.DataField', 
                Value: qty,
                },
            { 
                $Type: 'UI.DataField', 
                Value: price,
                },
                 { 
                $Type: 'UI.DataField', 
                Value: store_id,
                },

        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'PurchaseOrderItemFacet',
            Label: 'Purchase Order item',
            Target: '@UI.FieldGroup#PurchaseOrderItem'
        },
    ]
);
annotate electronicsapp.Sale.items with @( 
    UI.LineItem: [
        {
            Value: product_id,
        },
        {
            Value: qty,
        },
        {
            Value: price,
        },
        {
            Value: store_id,
        },
    ],
    UI.FieldGroup #saleItem: {
        $Type: 'UI.FieldGroupType',
        Data: [
            { 
                $Type: 'UI.DataField', 
                Value: product_id,
                },
            { 
                $Type: 'UI.DataField', 
                Value: qty,
                },
            { 
                $Type: 'UI.DataField', 
                Value: price,
                },
                 { 
                $Type: 'UI.DataField', 
                Value: store_id,
                },

        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'saleItemFacet',
            Label: 'sale item',
            Target: '@UI.FieldGroup#saleItem'
        },
    ]
);

annotate electronicsapp.PurchaseOrder with @( 
    UI.LineItem: [
        { 

            $Type: 'UI.DataField', 
        Value: purchaseOrderNumber 
        },
        { 
            $Type: 'UI.DataField',
             Value: businessPartner.BusinessPartnerID
              },
        { 
            $Type: 'UI.DataField',
             Value: purchaseOrderDate 
             }
             
             
    ],
    UI.FieldGroup #PurchaseOrderHeader: {
        $Type: 'UI.FieldGroupType',
        Data: [
            { 
                $Type: 'UI.DataField', 
                Value: purchaseOrderNumber 
                },
            { 
                $Type: 'UI.DataField', 
                Value: businessPartner.BusinessPartnerID 
                },
            { 
                $Type: 'UI.DataField', 
                Value: purchaseOrderDate 
                }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'PurchaseOrderHeaderFacet',
            Label: 'Purchase Order Header',
            Target: '@UI.FieldGroup#PurchaseOrderHeader'
        },
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'PurchaseOrderItems',
            Label: 'Purchase Order Items',
            Target: 'items/@UI.LineItem',
        },
    ]
);
annotate electronicsapp.Sale with @( 
    UI.LineItem: [
        { 
            $Type: 'UI.DataField', 
        Value: saleOrderNumber 
        },
        { 
            $Type: 'UI.DataField',
             Value: businessPartner.BusinessPartnerID
              },
        { 
            $Type: 'UI.DataField',
             Value: saleDate 
             }
             
             
    ],
    UI.FieldGroup #sale: {
        $Type: 'UI.FieldGroupType',
        Data: [
            { 
                $Type: 'UI.DataField', 
                Value: saleOrderNumber 
                },
            { 
                $Type: 'UI.DataField', 
                Value: businessPartner.BusinessPartnerID 
                },
            { 
                $Type: 'UI.DataField', 
                Value: saleDate
                }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'saleFacet',
            Label: 'sale information',
            Target: '@UI.FieldGroup#sale'
        },
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'Saleitemss',
            Label: 'Sale items',
            Target: 'items/@UI.LineItem',
        },
    ]
);
annotate electronicsapp.PurchaseOrder.items with {
    product_id @(
        // Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'Product List',
            CollectionPath: 'Product',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: product_id,
                    ValueListProperty: 'productid'
                },
                
                     ]
        }
                  );
              store_id @(
        // Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'Store List',
            CollectionPath: 'Store',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: store_id,
                    ValueListProperty: 'storeid'
                },
            
            ]
        }
    )
};
annotate electronicsapp.Sale.items with {
    product_id @(
        Common.ValueList: {
            Label: 'Product List',
            CollectionPath: 'Product',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: product_id,
                    ValueListProperty: 'productid'
                },
                     ]
        }
                  );
              store_id @(
        // Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'Store List',
            CollectionPath: 'Store',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: store_id,
                    ValueListProperty: 'storeid'
                },
            
            ]
        }
    )
};
annotate electronicsapp.StockData with {
    product_ID @(
        Common.ValueList: {
            Label: 'Product List',
            CollectionPath: 'Product',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: product_ID,
                    ValueListProperty: 'productid'
                  },
                     ]
        }
                  );
        store_ID @(
        // Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'Store List',
            CollectionPath: 'Store',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: store_ID,
                    ValueListProperty: 'storeid'
                },
            
            ]
        }
    )
};
