import 'package:flutter/material.dart';
import 'dart:ui'; // For ImageFilter.blur

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Événements de Quartier',
          style: TextStyle(color: Colors.white), // Text color in white
        ),
        backgroundColor: const Color(0xFF093B56), // Green color for the app bar
        iconTheme: const IconThemeData(
          color: Colors.white, // Back icon color in white
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpeg'), // Background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Blur intensity
            child: Container(
              color: Colors.black.withOpacity(0.2), // Slight dark overlay to enhance readability
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                _buildEventCard('Festival de Musique', 'Concert au parc central le 20 Octobre', context),
                _buildEventCard('Marché Local', 'Venez découvrir les produits locaux le 15 Octobre', context),
                _buildEventCard('Compétition de Football', 'Inscrivez-vous pour le tournoi de football le 25 Octobre', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String title, String description, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      elevation: 6, // Higher elevation for shadow
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Title text color in white
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Light white color for description
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Inscription à $title effectuée!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'S’inscrire',
                  style: TextStyle(color: Colors.black), // Button text in black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
