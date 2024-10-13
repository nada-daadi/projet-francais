import 'package:flutter/material.dart';
import 'dart:ui'; // For ImageFilter.blur

// ignore: use_key_in_widget_constructors
class TransportPage extends StatelessWidget {
  final List<Map<String, dynamic>> transports = [
    {"line": "Bus 42", "status": "À l'heure", "arrival": "3 min"},
    {"line": "Tram 3B", "status": "Retard", "arrival": "10 min"},
    {"line": "Train RER A", "status": "À l'heure", "arrival": "5 min"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suivi des Transports',
          style: TextStyle(fontSize: 20, color: Colors.white), // Text color in white
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
                image: AssetImage('assets/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Adjust the blur intensity
            child: Container(
              color: Colors.black.withOpacity(0.2), // Add a slight dark overlay
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: transports.length,
              itemBuilder: (context, index) {
                return _buildTransportCard(transports[index], context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransportCard(Map<String, dynamic> transport, BuildContext context) {
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
              Row(
                children: [
                  const Icon(Icons.directions_bus, color: Colors.white, size: 40), // Transport Icon in white
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transport['line'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color in white for better contrast
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Statut: ${transport['status']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70, // Light white color for the status text
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                transport['arrival'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Arrival time in white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
