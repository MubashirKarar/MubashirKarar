import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background color
      appBar: AppBar(
        title: const Text("Property Details",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.blueAccent, // Sleek AppBar color
        elevation: 0, // Remove shadow to make it cleaner
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent)), // Stylish title
            const SizedBox(height: 10),
            const Text("A beautiful property located in Los Angeles.",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight:
                        FontWeight.w400)), // Lighter font style for description
            const SizedBox(height: 20),
            Row(
              children: [
                _buildIconButton(Icons.call, "Call"),
                const SizedBox(width: 20),
                _buildElevatedButton("Buy Now"),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Gallery",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            const SizedBox(height: 10),
            // Gallery Section
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  GalleryImage(
                      imageUrl:
                          'https://th.bing.com/th/id/R.d1ad93015e8f92033dc884aa6c12c480?rik=PhQDSTGRxb5ZUw&pid=ImgRaw&r=0'),
                  GalleryImage(
                      imageUrl:
                          'https://i2-prod.nottinghampost.com/news/property/article2123975.ece/ALTERNATES/s1227b/0_8359380-interior24.jpg'),
                  GalleryImage(
                      imageUrl:
                          'https://th.bing.com/th/id/R.34d80f79521c7ae0cae2a8d279c0ae4e?rik=PUUFVvWJDDsmzQ&pid=ImgRaw&r=0'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Icon button with custom styling
  Widget _buildIconButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white, size: 24),
      label: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
    );
  }

  // Stylish buy now button
  Widget _buildElevatedButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Green color for "Buy Now"
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class GalleryImage extends StatelessWidget {
  final String imageUrl;

  const GalleryImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
