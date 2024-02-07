namespace com.satInfoTech.ElectronicsApp;

using { managed, cuid } from '@sap/cds/common';

entity BusinessPartner : cuid, managed {
    @title:'BusinessPartnerId'
    BusinessPartnerID  : String(10);
    @title:'Name'
    name        : String(20);
    @title:'Address1'
    address1    : String(30);
    @title:'Address2'
    address2    : String(30);
    @title:'PinCode'
    pincode     : String(10);
     @title:'State'
     state:String(2);
}
entity Store : cuid, managed {
    @title:'StoreId'
    storeid:String(20);
    @title:'Name'
    Name:String(20);
     @title:'Address1'
    address1    : String(30);
    @title:'Address2'
    address2    : String(30);
    @title:'City'
    city:String(20);
     @title:'PinCode'
    pincode     : String(10);
     @title:'State'
     state:String(2);
}
@cds.persistence.skip
entity State {
    @title : 'code'
    key code:  String(10);
    @title : 'description'
    description: String(30);
}