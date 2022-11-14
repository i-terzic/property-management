# Conceptual data model

## Entities (master data)

- [x] Tenant
- [x] Owner
- [x] Property Manager
- [x] Contractor

- [x] Address
- [x] Property
- [x] Flat

- [?] BankAccount

## Transactional entities

- [x] Payment
- [x] Bill
- [x] Contract
- [x] Transaction

### User Views

- [ ] Property Manager
  - [ ] create/modify new properties
  - [ ] create/modify new user
  - [ ] view data of properties/user
  - [ ] create reports
  - [ ] view data for managed properties/user
  - [ ] view invoice data for managed properties
  - [ ] view service charge settlements for managed properties
  - [ ] view open/closed positions/invoice for managed properties
  - [ ] view open/payed rents for properties/flats/houses etc.
- [ ] Owner
  - [ ] view data of own properties
  - [ ] create reports
  - [ ] view invoice data for own properties
  - [ ] view service charge settlements for own properties
  - [ ] view open/closed positions/invoice for own properties
  - [ ] view open/payed rents for properties/flats/houses etc.
- [ ] Tenant
  - [ ] view open/closed service charge settlements for rent property/flat/house etc.
  - [ ] view invoice for rent property/flat/house etc.

### Reports

- [ ] service charge settlement
- [ ] open positions

## General flow

1. Import flow
   1. owner gets invoice (CSV data)
   2. CSV data gets parsed
   3. Mapping
   4. duplicate check
   5. stored in tables
2. creation of service charge settlement
   1. master data is collected
   2. transactional data is collected
   3. allocation key is collected per position
   4. inidividual positions are calculated per tenant
   5. report is generated
