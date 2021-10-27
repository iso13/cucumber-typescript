import * as usersFile from '../config/users.json';
import * as AWS from 'aws-sdk';

const s3Instance: AWS.S3 = new AWS.S3({ apiVersion: '2006-03-01' });
let s3Creds: Array<string>;
let params;
let results;

export default {
  async getS3Credentials() {
    s3Creds = [usersFile['s3']['llh-data-storage'].access_key, usersFile['s3']['llh-data-storage'].secret_key];
    return s3Creds;
  },

  async putS3Credentials(bucketName: string, s3Creds: Array<string>) {
    params = { Bucket: bucketName };
    s3Instance.config.update({
      accessKeyId: s3Creds[0],
      secretAccessKey: s3Creds[1],
      region: 'us-west-2'
    });
  },

  async specifySubFolder(folderName: string) {
    params.Prefix = folderName;
  },

  async getListOfFiles() {
    await s3Instance
      .listObjects(params)
      .on('success', function(response) {
        results = response.data;
      })
      .promise();
    console.log(results);
  }
};
