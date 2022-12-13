/* eslint-disable no-unused-vars */

const { appPool } = require("../../db");
const _ = require("lodash");
const { Forbidden, BadRequest } = require("@feathersjs/errors");

exports.ScsPosition = class ScsPosition {
  constructor(options) {
    this.options = options || {};
  }

  async find(params) {
    if (_.isNil(params.query.tenantID) || _.isNil(params.query.year))
      throw new BadRequest("Param 'tenantID' or 'year' is missing.");

    const result = await appPool.query(
      `SELECT * FROM [group7].[scs_position_view] sp 
      WHERE sp.tenantID = ${Number.parseInt(params.query.tenantID)} 
      AND YEAR(sp.date) = ${Number.parseInt(params.query.year)}`
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
