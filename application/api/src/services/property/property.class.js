const { appPool } = require("../../db");
const _ = require("lodash");

const { BadRequest, Forbidden } = require("@feathersjs/errors");

/* eslint-disable no-unused-vars */
exports.Property = class Property {
  constructor(options) {
    this.options = options || {};
  }

  async find(params) {
    const result = await appPool.query("SELECT * FROM group7.Property");
    const data = _.get(result, "recordsets[0]");

    return data;
  }

  async get(id, params) {
    const result = await appPool.query(
      `SELECT * FROM group7.Property WHERE propertyID = ${id}`
    );
    const data = _.get(result, "recordset[0]");

    return {
      ...data,
    };
  }

  async create(data, params) {
    if (Array.isArray(data)) {
      throw new BadRequest(
        "Creating multiple Properties in one request is not supported!"
      );
    }

    const result = await appPool.query(
      `EXEC [group7].[create_new_property]
        @nrUnits = ${Number.parseInt(data.nrUnits)},
        @country = '${data.country}',
        @city = '${data.city}',
        @postalCode = ${Number.parseInt(data.postalCode)},
        @street = '${data.street}',
        @houseNr = ${Number.parseInt(data.houseNr)},
        @firstName = '${data.firstName}',
        @lastName = '${data.lastName}',
        @bankAccount = '${data.bankAccount}',
        @managerID = ${Number.parseInt(data.managerID)};`
    );

    const propertyID = _.get(result, "recordset[0].propertyID");

    return { ...data, propertyID };
  }

  async update(id, data, params) {
    if (_.isNil(data.propertyID)) throw new BadRequest("PropertyID missing.");
    const result = await appPool.query(
      `
      EXEC [group7].[update_property]
        @propertyID = ${id},
        @nrUnits = ${Number.parseInt(data.nrUnits)},
        @country = '${data.country}',
        @city = '${data.city}',
        @postalCode = ${Number.parseInt(data.postalCode)},
        @street = '${data.street}',
        @houseNr = ${Number.parseInt(data.houseNr)},
        @firstName = '${data.firstName}',
        @lastName = '${data.lastName}',
        @bankAccount = '${data.bankAccount}',
        @managerID = ${Number.parseInt(data.managerID)};
      `
    );
    return data;
  }

  async patch(id, data, params) {
    throw new Forbidden("Patch request is not permitted");
  }

  async remove(id, params) {
    return { id };
  }
};
