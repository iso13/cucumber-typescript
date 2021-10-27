@trinet @detailContributionsStrategysBreakdown @wip @fernando
Feature: Display all contribution strategies for each Benefit Program
  As a BCT user
  I need to be able to see in my proposal the contributions for each benefit program I set when quoting
  So I can be aware of my costs per benefit program

  @critical
  Scenario: Confirm funding EE(WSE) count, percentage contribution, dollar contributions and Fixed-Dollar cap amount
  are correct for all product lines of each benefit program

  @critical
  Scenario: Confirm funding ES(WSE) count, percentage contribution, dollar contributions and Fixed-Dollar cap amount
  are correct for all product lines of each benefit program

  @critical
  Scenario: Confirm funding EC(WSE) count, percentage contribution, dollar contributions and Fixed-Dollar cap amount
  are correct for all product lines of each benefit program

  @critical
  Scenario: Confirm funding EF(WSE) count, percentage contribution, dollar contributions and Fixed-Dollar cap amount
  are correct for all product lines of each benefit program

  @critical
  Scenario: For Market benefit Proposal ,ER charge for product line is total of eligible lowest cost plan per employee per benefit Program

  @critical
  Scenario: For Market benefit Proposal ,EE charge for product line is total of eligible lowest cost plan per employee per benefit Program

  @critical
  Scenario: For Market benefit Proposal, the total charge is the sum of EE cost and ER cost per benefit type

  @critical
  Scenario: For Benefit comparison proposal, ER charge for product line is total of eligible lowest cost plan per employee per benefit Program

  @critical
  Scenario: For Benefit comparison proposal, EE charge for product line is total of eligible lowest cost plan per employee per benefit Program

  @critical
  Scenario: For Benefit comparison proposal, the total charge is the sum of EE cost and ER cost per benefit type

  @critical
  Scenario: Confirm that for a benefit comparison proposal with benefit types: medical standard modeling, the ER charge is calculated based on
  member-plan assignments and the contributions strategy that is set for the benefit program

  @critical
  Scenario: Confirm that for a benefit comparison proposal with benefit types: medical standard modeling, the EE charge is calculated based on
  member-plan assignments and the contributions strategy that is set for the benefit program

  @critical
  Scenario: Confirm that for a benefit comparison proposal with benefit types: medical, the total charge is the sum of EE cost and ER cost
  per benefit type

  @critical
  Scenario: Confirm that for any proposal type and basic life benefit type, the ER charge is calculated according to
  the benefit program the employees were enrolled and the Plan assigned to it.

  @critical
  Scenario: Confirm that for any proposal type and basic life benefit type, the EE charge is calculated according to
  the benefit program the employees were enrolled and the Plan assigned to it.

  @critical
  Scenario: Confirm that for any proposal type and basic life benefit type, the total charge is the sum of EE cost and ER cost
  per benefit type

  @critical
  Scenario: Confirm that in the footer of every benefit program table you see the Benefit Program total charges for the employer calculated
  with the The sum of all the ER charges of the benefit types

  @critical
  Scenario: Confirm that in the footer of every benefit program table you see the Benefit Program total charges for the employee calculated
  with the The sum of all the EE charges of the benefit types

  @critical
  Scenario: Confirm that in the footer of every benefit program table you see the Benefit Program total charges for the
  sum of ER and EE benefit program total charges

  @critical
  Scenario: Confirm that at the end of the report you see the total charges for employer, the total charges
  for employee and total charges of the sum of employer and employee charges.

  @critical
  Scenario: Confirm that when you change the zip code of some members and then re-quote you see all rates are calculated according to the new members

  @critical
  Scenario: Confirm that when you remove some members and then re-quote you see all rates are calculated according to the left members and also
  WSE count get updated

  @critical
  Scenario: Confirm that when you change any contribution strategy in the original quote and then re-quote, such contribution strategy and
  their corresponding rates would be reflected in the new proposal

  @critical
  Scenario: Confirm that when you add a benefit program and then you re-quote tne new Benefit Program will be reflected in the proposal

  @critical
  Scenario: Confirm that when you remove a benefit program and then you re-quote tne removed Benefit Program wil not be present in the proposal

  @critical
  Scenario: Confirm that when you change the benefit program name and then you re-quote tne changed Benefit Program will be reflected in the proposal

  @critical
  Scenario: Confirm that when you re-quote from PCR to PCR you do not see any change in the page of new proposal

  @critical
  Scenario: Confirm that when you re-quote from BCR to PCR and all detail contributions break down conditions for being displayed are met, you
  see the page.

  @critical
  Scenario: Confirm that when you re-quote from PCR to BCR you do not see the page being displayed

  @critical
  Scenario: Confirm this section does not appear for BCR

  @critical
  Scenario: Confirm you see the page immediately after the Recommended Quotes page

  @critical
  Scenario: Confirm you see as many benefit programs tables as mapped benefit programs you have

  Scenario: Confirm disclaimer is always displayed at the bottom of the page

  Scenario: Confirm you see benefit type in the following order for a benefit program table: medical, dental, vision, life

  Scenario: Confirm funding cap plan is displayed with the selected plan name or with N/A if the strategy does not apply
  for all product lines of each benefit program
