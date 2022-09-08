import { firestore } from "firebase-admin";
import * as admin from "firebase-admin";
const {getFirestore} = require("firebase-admin/firestore");
admin.initializeApp();
const baseStore = getFirestore();
export const dBase = {
    careers: baseStore.collection('careers')
  }
export type careers = {
     type: string,
     model: string, 
     year: number 
    }