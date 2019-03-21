import 'package:firebase_functions_interop/firebase_functions_interop.dart';

void helloWorld(ExpressHttpRequest request) {
  request.response.writeln('Hello world');
  request.response.close();
}
