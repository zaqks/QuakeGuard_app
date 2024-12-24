import "dart:convert";

import "package:http/http.dart";

Future<bool> getVibration(String ip) async {
  Response rslt = await get(Uri.parse("http://$ip/api"));
  bool vib = json.decode(rslt.body)["vib"];

  return vib;
}

Future<void> stopVibration(String ip) async {
  await post(Uri.parse("http://$ip/api"));
}
