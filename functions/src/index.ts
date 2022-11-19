import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();
import {career, course, dBase} from "./models/base_models";

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript firebase deploy --only functions:getAllCareers

export const testConnection = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  console.log("connection test successful");
  response.send("Welcome, you have reached the edurald engine.");
});

export const getAllCareers = functions.https.onRequest(async (request, response) => {
  try {
    const resp: Array<career> = [];
    const careers = await dBase.careers.get();
    if (careers.empty) {
      console.log("No documents!");
    } else {
      careers.forEach((snapshot: admin.firestore.DocumentSnapshot) => {
        resp.push(snapshot.data() as career);
      });
      response.status(200).send({
        "status": 200,
        "data": resp,
      });
    }
  } catch (err) {
    functions.logger.error(err, {structuredData: true});
    response.send("error fetching data!");
  }
});

export const getCoursesByCareer = functions.https.onCall(async (data, response) => {
  try {
    console.log(data.careerId);
    const resp: Array<course> = [];
    const courses = await dBase.courses.where("careers", "array-contains", data.careerId).get();
    if (courses.empty) {
      console.log("No documents!");
      return false;
    } else {
      courses.forEach((snapshot: admin.firestore.DocumentSnapshot) => {
        resp.push(snapshot.data() as course);
      });
      return resp;
    }
  } catch (err) {
    functions.logger.error(err, {structuredData: true});
    return "error fetching data!";
  }
});

export const checkIfEmailExist = functions.https.onCall(async (data, response) => {
  try {
    console.log(data.email);
    const user = await dBase.users.where("email", "==", data.email).get();
    if (user.empty) {
      console.log("No documents!");
      return false;
    } else {
      return true;
    }
  } catch (err) {
    functions.logger.error(err, {structuredData: true});
    return false;
  }
});

export const checkIfUserNameExist = functions.https.onCall(async (data, response) => {
  try {
    console.log(data.email);
    const user = await dBase.users.where("unique", "==", data.displayname).get();
    if (user.empty) {
      console.log("No documents!");
      return false;
    } else {
      return true;
    }
  } catch (err) {
    functions.logger.error(err, {structuredData: true});
    return false;
  }
});
