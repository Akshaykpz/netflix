import 'dart:convert';

import 'package:http/http.dart' as http;

Future getdata() async {
  var url = Uri.parse('https://postman-echo.com/post');
  var response = await http.get(url);
  
}




