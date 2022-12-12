/* eslint-disable no-unused-vars */

const { appPool } = require("../../db");
const _ = require("lodash");
const { Forbidden } = require("@feathersjs/errors");

exports.Tenant = class Tenant {
  constructor(options) {
    this.options = options || {};
  }

  async find(params) {
    const result = await appPool.query("SELECT * FROM [group7].[Tenant]");

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
