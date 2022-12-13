const Ajv = require("ajv");

const { validateSchema } = require("feathers-hooks-common");

const schema = {
  type: "object",
  properties: {
    nrUnits: { type: "number" },
    country: { type: "string" },
    city: { type: "string" },
    postalCode: { type: "number" },
    street: { type: "string" },
    houseNr: { type: "number" },
    firstName: { type: "string" },
    lastName: { type: "string" },
    bankAccount: { type: "string" },
    managerID: { type: "number" },
  },
  additionalProperties: true,
  required: [
    "nrUnits",
    "country",
    "city",
    "postalCode",
    "street",
    "houseNr",
    "firstName",
    "lastName",
    "bankAccount",
    "managerID",
  ],
};

module.exports = { before: { create: validateSchema(schema, Ajv) } };
