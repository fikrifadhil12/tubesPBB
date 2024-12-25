import 'package:flutter/material.dart';
import 'mobil.dart'; // Pastikan ini mengarah ke file Car.dart yang Anda buat

class CarDetailScreen extends StatelessWidget {
  final Car data; // Menggunakan objek Car

  CarDetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'MOBIL DETAIL',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://example.com/your_image.jpg', // Ganti dengan URL gambar profil dari Google
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Use min to prevent taking up unnecessary space
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar mobil, sekarang menggunakan URL dari data.imageUrl atau URL statis
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/2020_Toyota_Avanza_1.5_Veloz_%28front%29%2C_West_Surabaya_03.jpg/800px-2020_Toyota_Avanza_1.5_Veloz_%28front%29%2C_West_Surabaya_03.jpg", // Ganti dengan URL gambar mobil dari Google
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image,
                      size:
                          80); // Menampilkan icon error jika gambar tidak ditemukan
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(height: 16),
              Text(
                data.name, // Akses dari objek Car
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SPECIFICATIONS",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text("Model: ${data.model}"), // Akses dari objek Car
                      Text("Warna: ${data.color}"), // Akses dari objek Car
                      Text("Harga: ${data.price}"), // Akses dari objek Car
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'BOOKING NOW',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
