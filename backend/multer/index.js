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
    sessionToken: 'FwoGZXIvYXdzEE8aDCe/5TRQBmt6mSVzoCLFAV4LCPIJbQho0ZknDyA7pcB94rZwKG2n8y1dYL+5yHO10vvE7X+BNeW5yMOuqXMHFIyaqunvVlzS5Alt9sQavkESPsR4WufTWnTVY4gEgbndiw13dHrXCSLg7LOxo0JjDaW/mr8OhOQTTGR6KQA72jaleZOjN2ypRMbnZV3+uHA09dpORY7PaOvsElWyqAmR+bM+JFj/d+ncBby6Tme3aU08ijTgHOjPg+bLKSrHngE463C9iyNhJUQid1Cv/WiXKwxw+1lcKK64wa8GMi3nVPIhmaI7jYk2Adiw/ftOFYG+xzJRDWIVcTDPQ9kb2qGASd7sHyz0N9WLdHE='
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
      cb(null, Date.now().toString() + '-' + file.originalname);; // Set the file name
    },
  }),
});

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
