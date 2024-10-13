import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cite_connecte/event_page.dart';
import 'package:cite_connecte/forum_page.dart';
import 'package:cite_connecte/service_page.dart';
import 'package:cite_connecte/tronsport_page.dart';
import 'about_page.dart'; // Importer la page About

void main() {
  runApp(const MyApp());
}

// Custom color constants
const Color customBlue = Color(0xFF093B56);
const Color customGreen = Color(0xFF3EA928);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: customGreen,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: customBlue),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpeg', // Add your background image here
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 7.0, sigmaY: 7.0), // Adjust the blur intensity
              child: Container(
                color: Colors.black
                    .withOpacity(0.3), // Add opacity to create a darker overlay
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content vertically
                children: [
                  const SizedBox(height: 80), // Add margin at the top
                  const Text(
                    'Bienvenue sur InnovCity',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for contrast
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Accédez rapidement aux services urbains',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[300], // Lighter text color
                    ),
                  ),
                  Expanded(
                    child: Center(
                      // Centers the GridView horizontally and vertically
                      child: GridView.count(
                        shrinkWrap:
                            true, // Prevents the GridView from expanding infinitely
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          _buildFeatureCard(context, Icons.directions_bus,
                              'Transports', TransportPage()),
                          _buildFeatureCard(context, Icons.event, 'Événements',
                              const EventPage()),
                          _buildFeatureCard(context, Icons.insert_drive_file,
                              'Services Publics', const PublicServicesPage()),
                          _buildFeatureCard(context, Icons.forum,
                              'Forum Citoyen', const ForumPage()),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Ajouter le bouton "À propos" pour accéder à la page "AboutPage"
                  ElevatedButton(
                    onPressed: () {
                      // Navigation vers la page "À propos"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: customBlue, // Couleur du texte
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text('En savoir plus sur le parti'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Animated Feature Card
  Widget _buildFeatureCard(BuildContext context, IconData icon, String title,
      Widget? destinationPage) {
    return GestureDetector(
      onTap: () {
        if (destinationPage != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Page for $title is under construction')));
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        shadowColor: Colors.teal.withOpacity(0.4), // Soft shadow
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Icon(icon,
                      size: 48, color: customBlue), // Animated icon color
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: customBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
