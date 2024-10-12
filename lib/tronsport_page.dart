import 'package:flutter/material.dart';

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
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: transports.length,
          itemBuilder: (context, index) {
            return _buildTransportCard(transports[index]);
          },
        ),
      ),
    );
  }

  Widget _buildTransportCard(Map<String, dynamic> transport) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        leading: const Icon(Icons.directions_bus, color: Colors.teal, size: 40),
        title: Text(
          transport['line'],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Statut: ${transport['status']}',
          style: const TextStyle(fontSize: 16),
        ),
        trailing: Text(
          transport['arrival'],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
      ),
    );
  }
}
