import 'package:flutter/material.dart';
import 'dart:ui'; // For ImageFilter.blur

class PublicServicesPage extends StatelessWidget {
  const PublicServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur effect
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Blurred background
              child: Container(
                color: Colors.black.withOpacity(0.2), // Dark overlay to enhance text visibility
              ),
            ),
          ),
          Padding(
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
        ],
      ),
      appBar: AppBar(
        title: const Text(
          'Demandes de Documents',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF093B56), // Green background color
        iconTheme: const IconThemeData(color: Colors.white), // White back icon
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
            colors: [const Color(0xFF3EA928).withOpacity(0.3), const Color(0xFF093B56)], // Gradient with green and blue
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Cliquez pour demander votre $title',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white, // Lighter text for description
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Demande de $title soumise!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
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
