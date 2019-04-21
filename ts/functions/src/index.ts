import { https } from 'firebase-functions'

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript

export const helloWorld = https.onRequest(
  (request, response): void => {
    response.send('Hello from Firebase!');
  }
);
