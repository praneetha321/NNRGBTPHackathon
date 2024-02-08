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
     @title:'is_vendor'
     is_vendor:Boolean default false;
     is_customer:Boolean default false;
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
entity Product : cuid, managed{
    @title:'ProductId'
    productid:String(10);
    @title:'product Name'
    productname:String(20);
    @title:'product image'
    productimage:String;
    @title:'product cost price'
    productcostprice:Decimal(10,2);
    @title:'product selling price'
    productsellingprice:Decimal(10,2);
}
entity StockData : cuid, managed {
    @title:'Store id'
     store  : Association to Store;
     @title:'Product id'
  product : Association to Product;
  @title:'stock qty'
  stockQty : Integer;
} 