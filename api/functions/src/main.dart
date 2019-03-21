import 'package:firebase_functions_interop/firebase_functions_interop.dart';

import "misc.dart";

void main() {
  functions['helloWorld'] = functions.https.onRequest(helloWorld);
}
