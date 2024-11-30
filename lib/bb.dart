import 'package:flutter/material.dart';
import 'package:googlefirebase/detail.dart'; // Assuming DetailScreen is in this file

class CraftsmanHousesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Craftsman Houses'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Craftsman House Card
            HouseCard(
              houseName: 'CRAFTSMAN HOUSE 1',
              address: '520 N Btoudry Ave Los Angeles',
              imageUrl: 'https://th.bing.com/th/id/R.d2a57ccd3e425a765264c5f40c30ee59?rik=H5TNgjOrf5EDRA&pid=ImgRaw&r=0',
            ),
            const SizedBox(height: 16),
            // Second Craftsman House Card
            HouseCard(
              houseName: 'CRAFTSMAN HOUSE 2',
              address: '520 N Btoudry Ave Los Angeles',
              imageUrl: 'https://th.bing.com/th/id/R.d2a57ccd3e425a765264c5f40c30ee59?rik=H5TNgjOrf5EDRA&pid=ImgRaw&r=0',
            ),
            const SizedBox(height: 16),
            // Third Craftsman House Card
            HouseCard(
              houseName: 'CRAFTSMAN HOUSE 3',
              address: '520 N Btoudry Ave Los Angeles',
              imageUrl: 'https://th.bing.com/th/id/R.d2a57ccd3e425a765264c5f40c30ee59?rik=H5TNgjOrf5EDRA&pid=ImgRaw&r=0',
            ),
          ],
        ),
      ),
    );
  }
}

class HouseCard extends StatelessWidget {
  final String houseName;
  final String address;
  final String imageUrl;

  const HouseCard({
    Key? key,
    required this.houseName,
    required this.address,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to DetailScreen when tapped
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(title: '$houseName Details'),
          ),
        );
      },
      child: Card(
        color: Colors.blueGrey[900],
        margin: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            // Text and Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    houseName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    address,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoIcon(Icons.bed, '4 Beds'),
                      _buildInfoIcon(Icons.bathtub, '4 Baths'),
                      _buildInfoIcon(Icons.garage, '1 Garage'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.yellow, size: 20.0),
        const SizedBox(width: 4.0),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
