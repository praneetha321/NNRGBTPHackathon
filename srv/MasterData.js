const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {
    const { BusinessPartner,State } = this.entities();
    this.on('READ', State, async(req) => {
        states = [
            {"code":"Ap", "description":"Andhra Pradesh"},
            {"code":"TS", "description":"Telangana"}
        ]
        states.$count=states.length;
        return states;
    })

});