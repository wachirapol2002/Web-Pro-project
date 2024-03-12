// Require multer for file upload
const AWS = require('aws-sdk');
const multer = require('multer');
const multerS3 = require('multer-s3');
const path = require('path');
const { NodeHttpHandler } = require('@smithy/node-http-handler')

const s3 = new AWS.S3({
  credentials: {
    accessKeyId: 'ASIA6GBMBEM5J5IR2TE3',
    secretAccessKey: 'hYT2RhB2Hpr6mOawes65sfTkP/SkZO8w74+ttNBs',
    
  },
  region: 'us-east-1',
  requestHandler: new NodeHttpHandler({
    requestTimeout: 10 * 1000,
    connectionTimeout: 10 * 1000,
  }),
})


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


const upload = multer({
  storage: multerS3({
    s3: s3,
    bucket: 'noneq-01',
    acl: 'public-read', // Set the access control level
    key: function (req, file, cb) {
      cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname)); // Set the file name
    },
  }),
});

module.exports = upload;
