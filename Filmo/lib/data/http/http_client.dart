import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url, Map<String, String>? headers});
  Future post(
      {required String url,
      required dynamic body,
      Map<String, String>? headers});
  Future put(
      {required String url,
      required dynamic body,
      Map<String, String>? headers});
}

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future get({required String url, Map<String, String>? headers}) async {
    return await client.get(Uri.parse(url), headers: headers);
  }

  @override
  Future post(
      {required String url,
      required body,
      Map<String, String>? headers}) async {
    return await client.post(
      Uri.parse(url),
      body: body,
      headers: {...?headers, "Content-Type": "application/json"},
    );
  }

  @override
  Future put(
      {required String url,
      required body,
      Map<String, String>? headers}) async {
    return await client.put(
      Uri.parse(url),
      body: body,
      headers: {...?headers, "Content-Type": "application/json"},
    );
  }
}
