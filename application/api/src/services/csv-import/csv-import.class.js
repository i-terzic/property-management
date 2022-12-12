const { appPool } = require("../../db");
const _ = require("lodash");
const { parse } = require("csv-parse/sync");

// Initialize the parser

exports.CsvImport = class CsvImport {
  constructor(options) {
    this.options = options || {};
  }

  async find(params) {
    const result = await appPool.query("SELECT * FROM group7.Stage");
    const data = _.get(result, "recordsets[0]");
    return data;
  }

  async get(id, params) {
    const result = await appPool.query(
      `SELECT * FROM group7.Stage WHERE stageId=${id}`
    );
    const data = _.get(result, "recordset[0]");
    return { ...data };
  }

  async create(data, params) {
    const records = parse(data.value, {
      delimiter: ";",
      raw: true,
      trim: true,
      from_line: 2,
    });
    let csv = "";
    for (const obj of records) {
      csv = csv + obj.raw + "&";
    }
    if (csv[0] == "&") csv = csv.slice(1);
    csv = csv.slice(0, -1);
    appPool.query(`exec [group7].[stage_sp] @data='${csv}'`);
  }
};
