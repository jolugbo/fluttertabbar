'use strict';

// [START all]
// [START import]
// The Cloud Functions for Firebase SDK to create Cloud Functions and set up triggers.
const functions = require('firebase-functions');

// The Firebase Admin SDK to access Firestore.
const admin = require('firebase-admin');
admin.initializeApp();
// [END import]
// [START addMessage]
// Take the text parameter passed to this HTTP endpoint and insert it into 
// Firestore under the path /messages/:documentId/original
// [START addMessageTrigger]
exports.getInvestmentBankingCourses = functions.https.onRequest(async (req, res) => {
  // [END addMessageTrigger]
  // Grab the text parameter.
  const original = req.query.text;
  // [START adminSdkAdd]
  // Push the new message into Firestore using the Firebase Admin SDK.
  const writeResult = await admin.firestore().collection('messages').add({original: original});
  // Send back a message that we've successfully written the message
  res.json({result: `Message with ID: ${writeResult.get} added.`});
  // [END adminSdkAdd]
});


exports.makeUppercase = functions.firestore.document('/messages/{documentId}')
    .onCreate((snap, context) => {
      const original = snap.data().original;

      functions.logger.log('Uppercasing', context.params.documentId, original);
      
      const uppercase = original.toUpperCase();
      
      return snap.ref.set({uppercase}, {merge: true});
    });
