import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
const {getFirestore} = require("firebase-admin/firestore");
admin.initializeApp();

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

export const testConnection = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  console.log("connection test successful");
  response.send("Welcome, you have reached the edurald engine.");
});

export const getAllCareers = functions.https.onRequest(async (request, response) => {
  const db = getFirestore();
  try {
    const snapshot = await db.collection("careers").doc("d32bf610-2a4f-11ed-b0e6-e76c95bb498e").get();
    if (!snapshot.exists) {
      console.log("No such document!");
    } else {
      console.log("Document data:", snapshot.data());
      response.send(snapshot.data());
    }
  } catch (err) {
    functions.logger.error(err, {structuredData: true});
    response.send("error fetching data!");
  }
});
