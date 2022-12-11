const { appPool } = require("../../db");
const _ = require("lodash");
const { BadRequest, Forbidden } = require("@feathersjs/errors");

/* eslint-disable no-unused-vars */
exports.Unit = class Unit {
  constructor(options) {
    this.options = options || {};
  }

  async find(params) {
    if (_.isNil(params.query.propertyID))
      throw new BadRequest("propertyID is required");
    const result = await appPool.query(
      `SELECT * FROM [group7].[unit] u WHERE u.propertyID = ${params.query.propertyID};`
    );

    const data = _.get(result, "recordsets[0]");
    return data;
  }

  async get(id, params) {
    const result = await appPool.query(
      `SELECT * FROM [group7].[Unit] WHERE unitID = ${id}`
    );

    const data = _.get(result, "recordset[0]");
    return {
      ...data,
    };
  }

  async create(data, params) {
    if (Array.isArray(data)) {
      throw new BadRequest(
        "Creating multiple Units in one request is not supported!"
      );
    }

    const result = await appPool.query(
      `
        EXEC [group7].[create_new_unit]
          @propertyID = ${Number.parseInt(data.propertyID)},
          @squareMeters = ${Number.parseInt(data.squareMeters)},
          @nrRooms = ${Number.parseInt(data.nrRooms)};
      `
    );

    const unitID = _.get(result, "recordset[0].unitID");
    return {
      ...data,
      unitID,
    };
  }

  async update(id, data, params) {
    throw new Forbidden("Update request is not permitted");
  }

  async patch(id, data, params) {
    throw new Forbidden("Patch request is not permitted");
  }

  async remove(id, params) {
    throw new Forbidden("Remove request is not permitted");
  }
};
