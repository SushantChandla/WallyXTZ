import 'package:http/http.dart' as http;

String _baseUrl='api.edo2net.tzkt.io';
String testAddress='tz1c4hy9Mcqm9cQ7GyZpkqzAFDVrWVY8ubs1';

Map<String,String> networks={
  'Mainnet':'api.tzkt.io',
  'Edo2net':'api.edo2net.tzkt.io',
  'Florence Net':'api.florencenet.tzkt.io'
};

Future<http.Response> getAccountInfo(String network,String address,){
  var url =Uri.https(networks[network], '/v1/accounts/$address',{'metadata':'true'});
  return http.get(url);
}


Future<http.Response> getAccountOperations(String address){
  var url =Uri.https(_baseUrl, '/v1/accounts/$address/operations');
  return http.get(url);
}