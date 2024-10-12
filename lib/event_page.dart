import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Événements de Quartier'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildEventCard('Festival de Musique', 'Concert au parc central le 20 Octobre', context),
            _buildEventCard('Marché Local', 'Venez découvrir les produits locaux le 15 Octobre', context),
            _buildEventCard('Compétition de Football', 'Inscrivez-vous pour le tournoi de football le 25 Octobre', context),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(String title, String description, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Inscription à $title effectuée!')),
            );
          },
          child: const Text('S’inscrire'),
        ),
      ),
    );
  }
}
