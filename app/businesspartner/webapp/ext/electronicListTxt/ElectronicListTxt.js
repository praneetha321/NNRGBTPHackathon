sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        Set Vendor: function(oBindingContext, aSelectedContexts) {       
            aSelectedContexts.forEach(element => {
               MessageToast.show(element.sPath);
               var aData = jQuery.ajax({
                   type: "PATCH",
                   contentType: "application/json",
                   url: "/odata/v4/electronicsapp/BusinessPartnerp" + element.sPath,
                   data: JSON.stringify({is_vendor: true})
               }).then(element.requestRefresh());
            });
        },
               Set Customer: function(oBindingContext, aSelectedContexts) {       
                aSelectedContexts.forEach(element => {
                   MessageToast.show(element.sPath);
                   var aData = jQuery.ajax({
                       type: "PATCH",
                       contentType: "application/json",
                       url: "/odata/v4/electronicsapp/BusinessPartner" + element.sPath,
                       data: JSON.stringify({is_vendor:false})
                   }).then(element.requestRefresh());
           });
        }
    }
}
}
)