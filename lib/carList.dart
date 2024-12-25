import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'mobil.dart'; // Import kelas Car
import 'detailMobil.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobil'),
        backgroundColor: const Color.fromARGB(255, 241, 240, 241),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('cars').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          // Ambil data mobil dari Firestore
          var carDocs = snapshot.data!.docs;

          // Mengonversi data menjadi list objek Car
          List<Car> carList = carDocs.map((doc) {
            return Car.fromMap(doc.data() as Map<String, dynamic>);
          }).toList();

          // Menampilkan daftar mobil
          return ListView.builder(
            itemCount: carList.length,
            itemBuilder: (context, index) {
              var car = carList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: CarCard(
                  data: car, // Mengirim objek Car ke CarCard
                  onViewPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailScreen(
                            data: car), // Mengirim objek Car ke CarDetailScreen
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final Car data;
  final VoidCallback onViewPressed;

  CarCard({required this.data, required this.onViewPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  data.color,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/2020_Toyota_Avanza_1.5_Veloz_%28front%29%2C_West_Surabaya_03.jpg/800px-2020_Toyota_Avanza_1.5_Veloz_%28front%29%2C_West_Surabaya_03.jpg",
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "4.0",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 4),
                    Row(
                      children: [
                        Icon(Icons.chat, color: Colors.green, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "50",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Harga',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      data.price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onViewPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'View',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
