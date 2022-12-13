const Ajv = require("ajv");

const { validateSchema } = require("feathers-hooks-common");

const schema = {
  type: "object",
  properties: {
    propertyID: { type: "number" },
    squareMeters: { type: "number" },
    nrRooms: { type: "number" },
  },
  additionalProperties: true,
  required: ["propertyID", "squareMeters", "nrRooms"],
};

module.exports = { before: { create: validateSchema(schema, Ajv) } };
