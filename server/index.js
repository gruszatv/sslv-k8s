const keys = require('./keys');
const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");
const cors = require("cors");
const Firestore = require('@google-cloud/firestore');


const db = new Firestore({
  projectId: 'qualified-gist-239722',
  keyFilename: 'service-accounts.json'
});

const app = express();

app.use(cors("*"));

var docRef = db.collection('users').doc('alovelace');

var setAda = docRef.set({
  first: 'Ada',
  last: 'Lovelace',
  born: 77777
});

app.listen(5000, err => {
  console.log('Listening');
});
