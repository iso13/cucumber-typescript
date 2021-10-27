import { Given, Then, When } from 'cucumber';

Given('I have a sample file {string}', async function(fileName: string) {
  this.latestResponse = fileName;
});

When('I parse the file into a JSON', async function() {
  this.latestResponse = await this.excelHelper.getJSONFromFirstXlsxSheet(this.latestResponse);
});

Then('I should print out the JSON to the console', async function() {
  console.log(this.latestResponse);
});

Given('I have a sample array of arrays and a file name {string}', async function(fileName: string) {
  this.latestResponse = fileName;
});

Then('I will write the data to an excel file', async function() {
  await this.excelHelper.writeAOAToExcelFile(this.latestResponse);
});
