import _ from "lodash";
import moment from "moment";
import { utils, writeFileXLSX } from "xlsx";

const formattedRow = (row, index) => {
  return [
    `${index + 1}) ${row.positionName}`,
    null,
    _.round(row.amount, 2) ?? "0,00",
    row.allocationTypeName ?? "",
  ];
};

const generateSCSExcel = ({
  scsPositionData,
  propertyData,
  scsInfo,
  prepaymentData,
}) => {
  const workbook = utils.book_new();
  const worksheet = utils.aoa_to_sheet([
    [null, null, null, "Dream House"],
    [null, null, null, "Property Management"],
    [null, null, null, "Flandernstr. 101"],
    [],
    [null, null, null, "73728 Esslingen"],
    [],
    ["DreamHouse Property - 73728 Esslingen"],
    [null, null, null, moment().format("DD.MM.YYYY")],
    [propertyData.street + " " + propertyData.houseNr],
    [propertyData.city + " " + propertyData.postalCode],
    [],
    [],
    ["Sehr geehrte Damen und Herren,"],
    [],
    [
      "nachfolgend erhalten Sie die Betriebskostenabrechung für den gemieteten Wohnraum.",
    ],
    [],
    [],
    ["Mit freundlichen Grüßen"],
    [],
    [`Betriebskostenabrechnung ${scsInfo.year ?? moment().format("YYYY")}`],
    ["(im Sinne der Anlage 3 des § 27 Abs. 1 der II. BV neue Fassung)"],
    [],
    ["Mietpartei:", null, "Summe", "Umlageart", "EUR"],
  ]);

  const formattedSCSPositions = _.map(scsPositionData, (item, index) =>
    formattedRow(item, index)
  );

  const totalSum = _.round(_.sum(_.map(scsPositionData, "amount")), 2);

  const sumRow = [[], ["Summe: ", null, totalSum]];

  const totalPrepayments = _.round(_.sum(_.map(prepaymentData, "amount")), 2);
  const prepaymentRow = [
    [],
    [
      "Vorauszahlungen: ",
      _.size(prepaymentData) === 0 ? "" : _.size(prepaymentData),
      totalPrepayments ?? 0.0,
    ],
  ];

  const additionalPayment = _.round(totalSum - totalPrepayments, 2);

  const additionalPaymentRow = [
    ["Nachzahlung: ", null, additionalPayment ?? "0,00", "EUR"],
  ];

  utils.sheet_add_aoa(worksheet, formattedSCSPositions, { origin: -1 });
  utils.sheet_add_aoa(worksheet, sumRow, { origin: -1 });
  utils.sheet_add_aoa(worksheet, prepaymentRow, { origin: -1 });
  utils.sheet_add_aoa(worksheet, additionalPaymentRow, { origin: -1 });

  utils.book_append_sheet(workbook, worksheet, "test");
  writeFileXLSX(
    workbook,
    `SCS-${scsInfo.year}-${scsInfo.lastName}-${scsInfo.firstName}.xlsx`
  );
};

export default generateSCSExcel;
