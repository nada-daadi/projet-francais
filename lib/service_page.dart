import 'package:flutter/material.dart';

class PublicServicesPage extends StatelessWidget {
  const PublicServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demandes de Documents'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildServiceCard('Carte d’Identité', context),
            _buildServiceCard('Permis de Conduire', context),
            _buildServiceCard('Certificat de Naissance', context),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: ElevatedButton(
          onPressed: () {
            // Logic to request the document goes here
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Demande de $title soumise!')),
            );
          },
          child: const Text('Demander'),
        ),
      ),
    );
  }
}
