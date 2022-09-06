import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

export const testConnection = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  console.log("connection test successful");
  response.send("Welcome, you have reached the edurald engine.");
});

export const getAllCareers = functions.https.onRequest((request, response) => {
  admin.firestore().doc("careers").get()
      .then((snapshot)=>{
        console.log(snapshot.data);
        response.send(snapshot.data);
      })
      .catch((error) =>{
        console.log("error got caught");
        response.send(error);
      });
  response.send("error fetching careers");
});
