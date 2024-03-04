import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parse_json_on_flutter/model/user.dart';

class Service {
  static const String url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<User>> getInfo() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<User> user = userFromJson(response.body);
        return user;
      } else {
        Fluttertoast.showToast(msg: 'getInfo Error');
        return <User>[];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'unknown getInfo Error');
      return <User>[];
    }
  }
}
