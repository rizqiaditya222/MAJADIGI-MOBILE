class SelectedService {
  final String category;
  final String service;

  const SelectedService({
    required this.category,
    required this.service,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SelectedService &&
              category == other.category &&
              service == other.service;

  @override
  int get hashCode =>
      category.hashCode ^ service.hashCode;
}