import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {dBase} from "../src/models/base_models"
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
  try {
    const careers = dBase.careers.get();
    if (careers.empty) {
      console.log("No documents!");
    } else {
      response.send(careers);
    }
  } catch (err) {
    functions.logger.error(err, {structuredData: true});
    response.send("error fetching data!");
  }
});
