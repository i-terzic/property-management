/* eslint-disable no-unused-vars */
const { appPool } = require("../../db");
const _ = require("lodash");
const { Forbidden } = require("@feathersjs/errors");

exports.OpenPosition = class OpenPosition {
  constructor(options) {
    this.options = options || {};
  }

  async find(params) {
    const result = await appPool.query(
      "SELECT * FROM [group7].[open_position_view]"
    );

    const data = _.get(result, "recordsets[0]");
    return data;
  }

  async get(id, params) {
    throw new Forbidden("Get request is not permitted");
  }

  async create(data, params) {
    throw new Forbidden("Create request is not permitted");
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
