# Conceptual data model

## Entities (master data)

- [X] Tenant
- [X] Owner
- [X] Property Manager
- [X] Contractor

- [X] Address
- [X] Property
- [X] Flat

- [?] BankAccount

## Transactional entities

- [X] Payment
- [X] Bill
- [X] Contract
- [X] Transaction

### User Views

- [ ] reports
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
