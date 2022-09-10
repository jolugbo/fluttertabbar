import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();
import {dBase} from "./models/base_models";

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

export const testConnection = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  console.log("connection test successful");
  response.send("Welcome, you have reached the edurald engine.");
});

export const getAllCareers = functions.https.onRequest(async (request, response) => {
  try {
    const careers = await dBase.careers.get();
    if (careers.empty) {
      console.log("No documents!");
    } else {
      careers.forEach((snapshot: admin.firestore.DocumentSnapshot) => {
        console.log(snapshot.id, "=>", snapshot.data());
      });
      response.status(200).send(careers);
    }
  } catch (err) {
    functions.logger.error(err, {structuredData: true});
    response.send("error fetching data!");
  }
});
