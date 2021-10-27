@trinet @quoteCensusModeling @wip @critical @eduardo
Feature: Quote census modeling data displayed
  As a Broker
  I want to review quote census modeling data
  So that I can understand members quote census modeling information

  Scenario: WSE's with employment status of "Part Time" or "Temp" should never display on the modeling census screen for BCR quotes

  Scenario: WSE's with employment status of "Part Time" or "Temp" should never display on the modeling census screen for PCR quotes

  Scenario: WSE's with employment status different of "Part Time" or "Temp" should always display on the modeling census screen for BCR quotes

  Scenario: WSE's with employment status different of "Part Time" or "Temp" should always display on the modeling census screen for PCR quotes

  Scenario: WSE's whose status is changed from Full Time or Member/Partner to Part Time or Temp shouldn’t display on modeling census for new BCR quote

  Scenario: WSE's whose status is changed from Full Time or Member/Partner to Part Time or Temp shouldn't display on modeling census for new PCR quote

  Scenario: WSE's whose status is changed from Part Time or Temp to Full Time or Member/Partner should display on modeling census for new BCR quote

  Scenario: WSE's whose status is changed from Part Time or Temp to Full Time or Member/Partner should display on modeling census for new PCR quote

  Scenario: Any BCR/PCR quote should always display "Census" tab

  Scenario: BCR Ancillary quotes should always display "Employee Name", "Benefit Program", "Coverage", "State", "Zip", "Plan" as row's headers

  Scenario: Validate correct Row headers are displayed for PCR Ancillary quotes

  Scenario: BCR Medical quotes should always display "Employee Name", "Benefit Program", "Coverage", "State", "Zip", "Plan" as row's headers

  Scenario: Validate correct Row headers are displayed for PCR Medical quotes

  Scenario: Correct "Coverage Status" value should display correctly for all Employees for BCR/PCR quotes

  Scenario: Correct "Benefit Program" value should display correctly for all Employees for BCR/PCR quotes

  Scenario: Correct "State" and "Zip" value should display correctly for all Employees for BCR/PCR quotes

  Scenario: Correct "EE Rate" and "DEP Rate" value should display correctly for all Employees for Medical PCR quotes

  Scenario: Correct "EE Cost", "ER Cost" and "Total Cost" value should display correctly for all Employees for BCR/PCR quotes

  Scenario: Any Benefit Program update should be reflected correctly in "Benefit Program" column for affected Employees for BCR/PCR quotes

  Scenario: Any Profile Data or Census should reflect correctly in "Coverage Status", "State" and "Zip" column for affected Employees for BCR/PCR quotes
