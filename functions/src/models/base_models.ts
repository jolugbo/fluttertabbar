const {getFirestore} = require("firebase-admin/firestore");
const baseStore = getFirestore();
export const dBase = {careers: baseStore.collection("careers"), users: baseStore.collection("users")};
export type career = {approved: boolean, careerName: string, createdBy: string, description: string};
