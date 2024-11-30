import 'package:flutter/material.dart';
import 'package:googlefirebase/detail.dart';
import 'package:googlefirebase/whislist.dart'; // Assuming DetailScreen is in this file

void main() {
  runApp(const GdView());
}

class GdView extends StatefulWidget {
  const GdView({super.key});

  @override
  State<GdView> createState() => _GdViewState();
}

class _GdViewState extends State<GdView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              // This is the text part
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Discover Best\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    TextSpan(
                      text: 'And Suitable Property',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              const Spacer(), // This makes space between the text and the icon
              // This is the bookmark icon at the end of the row
              IconButton(
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 30, // Increased icon size
                ),
                onPressed: () {
                  // Navigate to a new screen using pushReplacement
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const HP(title: 'WishList'), // Fixed typo here
                    ),
                  );
                },
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: const Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Craftsman House Card
                  Center(
                    child: HouseCard(),
                  ),
                  SizedBox(height: 24),
                  // Nearby Section Title
                  Text(
                    "Nearby Your Location",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Ranch Home Card
                  RanchHomeCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Craftsman House Card
class HouseCard extends StatelessWidget {
  const HouseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to DetailScreen when tapped
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const DetailScreen(title: 'Craftsman House Details'),
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.network(
                "https://th.bing.com/th/id/R.d2a57ccd3e425a765264c5f40c30ee59?rik=H5TNgjOrf5EDRA&pid=ImgRaw&r=0",
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
                  const Text(
                    'CRAFTSMAN HOUSE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '520 N Btoudry Ave Los Angeles',
                    style: TextStyle(
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

// Ranch Home Card (example)
class RanchHomeCard extends StatelessWidget {
  const RanchHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://th.bing.com/th?id=OPHS.nQGXccaY2axfAA474C474&w=592&h=550&o=5&pid=21.1',
                    height: 100,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "RANCH HOME",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "520 N Btoudry Ave Los Angeles",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoItem(icon: Icons.bed, text: "4 Beds"),
                InfoItem(icon: Icons.bathtub, text: "4 Baths"),
                InfoItem(icon: Icons.garage, text: "1 Garage"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
