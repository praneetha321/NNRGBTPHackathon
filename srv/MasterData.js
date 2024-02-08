const cds = require('@sap/cds');
function validateCostPrice(productData) {
    const { productcostprice, productsellingprice } = productData;
    if (productcostprice >= productsellingprice) {
        throw new Error("Product cost price must be less than selling price.");
    }
}
module.exports = cds.service.impl(function () {
    const { BusinessPartner,State,Product } = this.entities();
    this.before(['CREATE', 'UPDATE'], Product, async (req) => {
        try {
             validateCostPrice(req.data);
        } catch (error) {
            req.error({ code: 'INVALID_COST_PRICE', message: error.message });
        }
    });
    this.on('READ', State, async(req) => {
        states = [
            {"code":"Ap", "description":"Andhra Pradesh"},
            {"code":"TS", "description":"Telangana"}
        ]
        states.$count=states.length;
        return states;
    })

});