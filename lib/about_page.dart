import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Function to launch the URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Create a Uri object from the URL
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri); // Launch the URL
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À Propos de Cité Intelligente 2030'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTitleSection(),
            const SizedBox(height: 16),
            _buildIntroduction(),
            const SizedBox(height: 16),
            _buildValues(),
            const SizedBox(height: 16),
            _buildObjectives(),
            const SizedBox(height: 16),
            _buildLogoExplanation(),
            const SizedBox(height: 32),
            _buildSocialMediaLinks(), // Add the social media links here
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        Image.asset('assets/logo.png', width: 150, height: 150),
        const SizedBox(height: 8),
        const Text(
          'Cité Intelligente 2030 (InnovCity)',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Une Nouvelle Ère Urbaine : Smart, Écologique, Humaine',
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }

  Widget _buildIntroduction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notre Vision',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Le parti "Cité Intelligente 2030" repose sur une vision audacieuse de la société de demain, '
          'où l\'intelligence artificielle (IA) et la technologie redéfinissent la manière dont nous vivons et interagissons '
          'avec nos villes. Nous croyons fermement que les technologies intelligentes, lorsqu\'elles sont utilisées de manière '
          'responsable et éthique, peuvent transformer nos villes en environnements plus durables, inclusifs et efficaces.',
        ),
      ],
    );
  }

  Widget _buildValues() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nos Valeurs',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '1. Durabilité: Nous nous engageons à utiliser l\'IA pour répondre aux enjeux environnementaux. '
          'Grâce à des solutions intelligentes de gestion des ressources et des déchets, nous aspirons à réduire l\'empreinte '
          'écologique des villes tout en améliorant la qualité de vie des citoyens.\n\n'
          '2. Inclusion: Nous croyons que la technologie doit servir tous les citoyens, sans distinction. L\'IA peut personnaliser '
          'les services publics pour qu\'ils soient accessibles et adaptés à chacun, quelles que soient les origines, les âges ou '
          'les conditions physiques.\n\n'
          '3. Efficacité: L\'optimisation des infrastructures urbaines grâce à l\'IA permettra de mieux gérer les transports, la sécurité '
          'et les services de santé, en réduisant les inégalités et en améliorant la productivité urbaine.',
        ),
      ],
    );
  }

  Widget _buildObjectives() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nos Objectifs',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '• Révolutionner les Transports Urbains : Intégrer l\'IA pour optimiser la gestion du trafic et développer des transports '
          'propres et autonomes.\n\n'
          '• Gestion Intelligente des Ressources : Créer des réseaux intelligents pour gérer l\'eau, l\'électricité et les déchets.\n\n'
          '• Améliorer la Sécurité Urbaine : Utiliser l\'IA pour surveiller les zones urbaines et prévenir les crimes tout en respectant '
          'les droits des citoyens.\n\n'
          '• Santé Connectée : Développer des solutions intelligentes pour améliorer l\'accessibilité et la qualité des soins.',
        ),
      ],
    );
  }

  Widget _buildLogoExplanation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Signification du Logo',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Notre logo symbolise l\'engagement du parti envers l\'innovation durable et l\'harmonie entre la technologie et l\'environnement. '
          'Le vert représente la nature, la durabilité et le progrès écologique, tandis que le bleu symbolise la stabilité, la confiance et '
          'la fiabilité. Cette combinaison de couleurs reflète l\'équilibre entre des politiques avant-gardistes et une gouvernance stable.\n\n'
          
        ),
        const SizedBox(height: 16),
        Image.asset('assets/logo_element.png', width: 500, height: 500), // Example logo elements image
      ],
    );
  }

  Widget _buildSocialMediaLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.facebook),
          color: Colors.blue,
          onPressed: () => _launchURL('https://www.facebook.com/InnovCity2030'),
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.camera_alt), // Instagram Icon
          color: Colors.purple,
          onPressed: () => _launchURL('https://www.instagram.com/InnovCity2030'),
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.video_library), // YouTube Icon
          color: Colors.red,
          onPressed: () => _launchURL('https://www.youtube.com/c/InnovCity2030'),
        ),
      ],
    );
  }
}
