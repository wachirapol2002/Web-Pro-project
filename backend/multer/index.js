// Require multer for file upload
const AWS = require('aws-sdk');
const multer = require('multer');
const multerS3 = require('multer-s3');
require("dotenv").config();
const { NodeHttpHandler } = require('@smithy/node-http-handler')

const s3 = new AWS.S3({
  credentials: {
    accessKeyId: process.env.aws_access_key_id,
    secretAccessKey: process.env.aws_secret_access_key,
    sessionToken: process.env.aws_session_token
  },
  region: 'us-east-1',
  requestHandler: new NodeHttpHandler({
    requestTimeout: 10 * 1000,
    connectionTimeout: 10 * 1000,
  }),
})

const upload = multer({
  storage: multerS3({
    s3: s3,
    bucket: 'noneq-01',
    acl: 'public-read', // Set the access control level
    key: function (req, file, cb) {
      cb(null, Date.now().toString() + '-' + file.originalname); // Set the file name
    },
  }),
});

// cb(null, Date.now().toString() + '-' + file.originalname);; // Set the file name

// SET STORAGE
// var storage = multer.diskStorage({
//   destination: function (req, file, callback) {
//     callback(null, './static/uploads')
//   },
//   filename: function (req, file, callback) {
//     callback(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
//   }
// })
// const upload = multer({ storage: storage })

module.exports = upload;
