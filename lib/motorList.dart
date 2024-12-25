import 'package:flutter/material.dart';
import 'detailMotor.dart';
import 'motor.dart';

class MotorListScreen extends StatelessWidget {
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
          'MOTOR', // Ganti menjadi MOTOR
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
                'https://example.com/your_image.jpg', // Ganti dengan URL gambar profil yang sesuai
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: motorData.map((data) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: MotorCard(
              // Ganti dengan MotorCard
              data: data,
              onViewPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MotorDetailScreen(data: data),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MotorCard extends StatelessWidget {
  final Map<String, String> data;
  final VoidCallback onViewPressed;

  MotorCard({required this.data, required this.onViewPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data["name"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  data["space"]!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.network(
                  data["imageUrl"]!,
                  width: 80,
                  height: 50,
                  fit: BoxFit.cover,
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
                          data["rating"]!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.chat, color: Colors.green, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '${data["reviews"]} reviews',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('Harga', style: TextStyle(color: Colors.grey)),
                    Text(
                      data["price"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                'view',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
