const cds = require('@sap/cds');
function validateCostPrice(productData) {
    const { productcostprice, productsellingprice } = productData;
    if (productcostprice >= productsellingprice) {
        throw new Error("Product cost price must be less than selling price.");
    }
}

module.exports = cds.service.impl(function () {
    const { BusinessPartner, State, Product, PurchaseOrder,Sale,StockData } = this.entities();

    this.before(['CREATE', 'UPDATE'], Product, async (req) => {
        try {
            validateCostPrice(req.data);
        } catch (error) {
            req.error({ code: 'INVALID_COST_PRICE', message: error.message });
        }
    });

    this.before('CREATE', BusinessPartner, async (req) => {
        const data = req.data;
        console.log('BusinessPartner data:', data);
        if (data.Is_gstn_registered && !data.GSTIN_Number) {
            req.error(400, 'If GSTN registration is enabled, GSTIN Number is required.');
        }
    });

    this.on('READ', State, async (req) => {
        const states = [
            { "code": "Ap", "description": "Andhra Pradesh" },
            { "code": "TS", "description": "Telangana" }
        ];
        states.$count = states.length;
        return states;
    });

    this.before('CREATE', PurchaseOrder, async (req) => {
        const { items } = req.data;
        for (const item of items) {
            const product = await SELECT.one.from(Product).where({ productid: item.product_id });
            if (product && item.price >= product.productcostprice) {
                req.error(400, 'Price in PurchaseOrder must be less than product cost price.');
            }
        }
    });
    // this.before('CREATE', Sale, async (req) => {
    //     const { items } = req.data;
    //     for (const item of items) {
    //         const product = await SELECT.one.from(Product).where({ productid: item.product_id });
    //         if (product && item.price >= product.productsellingprice) {
    //             req.error(400, 'Price in PurchaseOrder must be less than product selling price.');
    //         }
    //     }
    //     for (const item of items) {
    //         const stockEntry = await SELECT.one.from(StockData).where({ store_ID: item.store_id, product_ID: item.product_id });
    //         if (stockEntry) {
    //             stockEntry.stockQty -= item.qty;
    //             await UPDATE(StockData).set(stockEntry).where({ store_ID: item.store_id, product_ID: item.product_id });
    //         } else {
    //             console.error('Stock entry not found for product:', item.product_id, 'and store:', item.store_id);
    //         }
    //     }
    // });
    this.before('CREATE', Sale, async (req) => {
        const { items } = req.data;
        for (const item of items) {
            const product = await SELECT.one.from(Product).where({ productid: item.product_id });
            if (product && item.price >= product.productsellingprice) {
                req.error(400, 'Price in Sale must be less than product selling price.');
                return; // Stop execution if error encountered
            }
        }
        for (const item of items) {
            const stockEntry = await SELECT.one.from(StockData).where({ store_ID: item.store_id, product_ID: item.product_id });
            if (stockEntry) {
                stockEntry.stockQty -= item.qty;
                await UPDATE(StockData).set(stockEntry).where({ store_ID: item.store_id, product_ID: item.product_id });
            } else {
                console.error('Stock entry not found for product:', item.product_id, 'and store:', item.store_id);
            }
        }
    });
    
});