const {getFirestore} = require("firebase-admin/firestore");
const baseStore = getFirestore();
export const dBase = {careers: baseStore.collection("careers"), users: baseStore.collection("users"), courses: baseStore.collection("courses")};
export type career = {approved: boolean, careerName: string, createdBy: string, description: string};
export type course = {approved: boolean, course_name: string, createdBy: string, description: string};
