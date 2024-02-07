using { com.satInfoTech.ElectronicsApp as db } from '../db/MasterData/schema';

service electronicsapp {
     entity BusinessPartner as projection on db.BusinessPartner;
     entity Store as projection on db.Store;
     entity State as projection on db.State;
}
annotate electronicsapp.BusinessPartner with {
    name @assert.format: '^[a-zA-Z]{2,}$';
    pincode   @assert.format: '^(\d{4}|\d{6})$';
};
annotate electronicsapp.BusinessPartner with @odata.draft.enabled;
annotate electronicsapp.Store with @odata.draft.enabled;
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