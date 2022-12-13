const { appPool } = require("../../db");
const _ = require("lodash");
const { Forbidden, BadRequest } = require("@feathersjs/errors");

/* eslint-disable no-unused-vars */
exports.Prepayment = class Prepayment {
  constructor(options) {
    this.options = options || {};
  }

  async find(params) {
    if (_.isNil(params.query.year) || _.isNil(params.query.tenantID))
      throw new BadRequest(
        "Required query parameter 'year' or 'tenantID' is missing."
      );
    const result = await appPool.query(
      `
        SELECT * FROM [group7].[Prepayment] p
        WHERE YEAR(p.date) = ${Number.parseInt(params.query.year)}
        AND p.tenantID = ${Number.parseInt(params.query.tenantID)}
      `
    );
    const data = _.get(result, "recordsets[0]");

    return data;
  }

  async get(id, params) {
    throw new Forbidden();
  }

  async create(data, params) {
    throw new Forbidden();
  }

  async update(id, data, params) {
    throw new Forbidden();
  }

  async patch(id, data, params) {
    throw new Forbidden();
  }

  async remove(id, params) {
    throw new Forbidden();
  }
};
