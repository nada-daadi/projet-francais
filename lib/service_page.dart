import 'package:flutter/material.dart';

class PublicServicesPage extends StatelessWidget {
  const PublicServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Adding the same background as HomePage
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpeg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 80), // Top padding for better visibility
              _buildServiceCard('Carte d’Identité', context),
              _buildServiceCard('Permis de Conduire', context),
              _buildServiceCard('Certificat de Naissance', context),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Demandes de Documents'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
    );
  }

  Widget _buildServiceCard(String title, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      elevation: 6, // Higher elevation for more shadow
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Wrap text content in an Expanded widget
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Cliquez pour demander votre $title',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                      overflow: TextOverflow.ellipsis, // Avoid overflow of text
                      maxLines: 2, // Limit text to 2 lines
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8), // Add some space between text and button
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Demande de $title soumise!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // Change button text to black
                child: const Text(
                  'Demander',
                  style: TextStyle(color: Colors.black), // Text in black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
