class Model {
  final String title;
  final String description;
  final String icon;

  Model({required this.title, required this.description, required this.icon});

  factory Model.fromFirestore(Map<String, dynamic> data) {
    return Model(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? '',
    );
  }
}
