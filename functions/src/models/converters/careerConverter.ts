import {career} from "../base_models";

export const careerConverter = {
  toFirestore: (data: career) => data,
  fromFirestore: (snap: FirebaseFirestore.QueryDocumentSnapshot) =>
      snap.data() as career,
};
