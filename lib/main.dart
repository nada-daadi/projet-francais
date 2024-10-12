import 'package:cite_connecte/event_page.dart';
import 'package:cite_connecte/forum_page.dart';
import 'package:cite_connecte/service_page.dart';
import 'package:cite_connecte/tronsport_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(), // Separate HomePage into its own widget
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cité Connectée',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Bienvenue sur Cité Connectée',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Accédez rapidement aux services urbains',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildFeatureCard(context, Icons.directions_bus, 'Transports', TransportPage()), // Navigate to TransportPage
                  _buildFeatureCard(context, Icons.event, 'Événements',   const EventPage()), // Placeholder for EventsPage
                  _buildFeatureCard(context, Icons.insert_drive_file, 'Services Publics', const PublicServicesPage()), // Placeholder for ServicesPage
                  _buildFeatureCard(context, Icons.forum, 'Forum Citoyen', const ForumPage()), // Placeholder for ForumPage
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Generic Widget for Feature Cards with Navigation
  Widget _buildFeatureCard(BuildContext context, IconData icon, String title, Widget? destinationPage) {
    return GestureDetector(
      onTap: () {
        if (destinationPage != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Page for $title is under construction')));
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.teal),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
