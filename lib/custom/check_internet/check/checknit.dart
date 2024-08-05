import 'package:http/http.dart' as http;

checkInternet() async {
  try {
    final response = await http.get(Uri.parse('https://www.google.com/'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
