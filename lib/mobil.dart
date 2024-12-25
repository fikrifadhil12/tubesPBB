class Car {
  final String name;
  final String price;
  final String color;
  final String model;
  final String imageUrl; // Menambahkan properti imageUrl untuk gambar

  Car({
    required this.name,
    required this.price,
    required this.color,
    required this.model,
    required this.imageUrl, // Menambahkan imageUrl ke konstruktor
  });

  factory Car.fromMap(Map<String, dynamic> data) {
    return Car(
      name: data['name'] ?? '',
      price: data['price'] ?? '',
      color: data['color'] ?? '',
      model: data['model'] ?? '',
      imageUrl: data['imageUrl'] ?? '', // Menambahkan imageUrl
    );
  }
}

// Menambahkan URL gambar secara langsung ke dalam data mobil
final List<Map<String, String>> carData = [
  {
    "imageUrl":
        "data:image/jpeg;base64,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", // URL gambar mobil
  },
  // Tambahkan data mobil lainnya sesuai kebutuhan
];
