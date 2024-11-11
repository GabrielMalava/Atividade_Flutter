import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/service_model.dart';

class ApiService {
  final String baseUrl = 'http://localhost:3000';


  Future<List<ServiceModel>> fetchServices() async {
    final response = await http.get(Uri.parse('$baseUrl/services'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ServiceModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar serviços');
    }
  }

 
  Future<ServiceModel> addService(ServiceModel service) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/services'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(service.toJson()),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 201) {
      return ServiceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro ao adicionar serviço: ${response.body}');
    }
  } catch (e) {
    print('Erro de conexão: $e');
    throw Exception('Erro ao adicionar serviço');
  }
}

}
