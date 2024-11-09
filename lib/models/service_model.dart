class ServiceModel {
  final String id;
  final String name;
  final String description;
  final DateTime availabilityDate;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.availabilityDate,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'] ?? 'ID indisponível', // Valor padrão para id
      name: json['name'] ?? 'Nome indisponível', // Valor padrão para name
      description: json['description'] ?? 'Descrição indisponível', // Valor padrão para description
      availabilityDate: json['availabilityDate'] != null 
          ? DateTime.parse(json['availabilityDate'])
          : DateTime.now(), // Valor padrão para availabilityDate
    );
  }
}
