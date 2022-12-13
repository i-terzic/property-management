/* eslint-disable no-unused-vars */

const { appPool } = require("../../db");
const _ = require("lodash");
const { Forbidden } = require("@feathersjs/errors");

exports.Tenant = class Tenant {
  constructor(options) {
    this.options = options || {};
  }

  async find(params) {
    const result = await appPool.query(`
    SELECT 
      t.tenantID,
      t.firstName,
      t.lastName,
      t.bankAccount,
      u.propertyID
    FROM 
      [group7].[Tenant] t
    LEFT JOIN 
      [group7].[Contract] c
    ON 
      t.tenantID = c.tenantID 
    LEFT JOIN 
      [group7].[Unit] u 
    ON
      u.unitID = c.unitID;	
    `);

    const data = _.get(result, "recordsets[0]");
    return data;
  }

  async get(id, params) {
    const result = await appPool.query(`
    SELECT 
      t.tenantID,
      t.firstName,
      t.lastName,
      t.bankAccount,
      u.propertyID
    FROM 
      [group7].[Tenant] t
    LEFT JOIN 
      [group7].[Contract] c
    ON 
      t.tenantID = c.tenantID 
    LEFT JOIN 
      [group7].[Unit] u 
    ON
      u.unitID = c.unitID
    WHERE 
      t.tenantID = ${id}	
    `);

    const data = _.get(result, "recordset[0]");

    return {
      ...data,
    };
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
