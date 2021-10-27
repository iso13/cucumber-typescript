import { Given, When, Then } from 'cucumber';

Given('I have login credentials for the s3 repo', async function() {
  this.latestResponse = await this.s3.getS3Credentials();
});

When('I log in to {string}', async function(bucketName: string) {
  await this.s3.putS3Credentials(bucketName, this.latestResponse);
});

When('I specify the {string} folder', async function(folderName: string) {
  await this.s3.specifySubFolder(folderName);
});

Then('I should be able to see all available files in the bucket', async function() {
  await this.s3.getListOfFiles();
});
