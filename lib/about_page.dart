import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "À Propos de Nous",
          style: TextStyle(color: Colors.white), // Title in white
        ),
        backgroundColor: const Color(0xFF093B56), // Primary color
        iconTheme: const IconThemeData(
          color: Colors.white, // Back icon color set to white
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white, // Text in white
          indicatorColor: Colors.white, // Indicator in white
          unselectedLabelColor: Colors.white70, // Unselected tab text color
          tabs: const [
            Tab(text: "Vision"),
            Tab(text: "Valeurs"),
            Tab(text: "Objectifs"),
            Tab(text: "Logo"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildVisionCard(),
          _buildValuesCard(),
          _buildObjectivesCard(),
          _buildLogoCard(),
        ],
      ),
    );
  }

  Widget _buildVisionCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView( // Ajout de SingleChildScrollView pour éviter l'overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notre Vision',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text in white for better readability
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Le parti "Cité Intelligente 2030" repose sur une vision audacieuse de la société de demain, où l\'intelligence artificielle (IA) et la technologie redéfinissent la manière dont nous vivons et interagissons avec nos villes. '
                      'Nous croyons fermement que les technologies intelligentes, lorsqu\'elles sont utilisées de manière responsable et éthique, peuvent transformer nos villes en environnements plus durables, inclusifs et efficaces.',
                  style: TextStyle(fontSize: 16, color: Colors.white70), // Light text color
                ),
                const SizedBox(height: 20), // Spacing before the org chart
                const Text(
                  'Organigramme du Parti',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    'assets/logo_element.png', // Path to your organizational chart image
                    width: 300, // Adjust the width as necessary
                    height: 200, // Adjust the height as necessary
                    fit: BoxFit.cover, // Adjust the fit as necessary
                  ),
                ),
              ],
            ),
          ),
        ),
        color: const Color(0xFF093B56), // Card background color matching the theme
      ),
    );
  }



  Widget _buildValuesCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView( // Make the content scrollable
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Nos Valeurs',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text in white for better readability
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Durabilité: Nous nous engageons à utiliser l\'IA pour répondre aux enjeux environnementaux. '
                      'Grâce à des solutions intelligentes de gestion des ressources et des déchets, nous aspirons à réduire l\'empreinte '
                      'écologique des villes tout en améliorant la qualité de vie des citoyens.\n\n'
                      '2. Inclusion: Nous croyons que la technologie doit servir tous les citoyens, sans distinction. L\'IA peut personnaliser '
                      'les services publics pour qu\'ils soient accessibles et adaptés à chacun, quelles que soient les origines, les âges ou '
                      'les conditions physiques.\n\n'
                      '3. Efficacité: L\'optimisation des infrastructures urbaines grâce à l\'IA permettra de mieux gérer les transports, la sécurité '
                      'et les services de santé, en réduisant les inégalités et en améliorant la productivité urbaine.',
                  style: TextStyle(fontSize: 16, color: Colors.white70), // Light text color
                ),
              ],
            ),
          ),
        ),
        color: const Color(0xFF093B56), // Card background color matching the theme
      ),
    );
  }


  Widget _buildObjectivesCard() {
    return _buildCard(
      title: 'Nos Objectifs',
      content: '• Révolutionner les Transports Urbains : Intégrer l\'IA pour optimiser la gestion du trafic et développer des transports propres et autonomes.\n\n'
          '• Gestion Intelligente des Ressources : Créer des réseaux intelligents pour gérer l\'eau, l\'électricité et les déchets.\n\n'
          '• Améliorer la Sécurité Urbaine : Utiliser l\'IA pour surveiller les zones urbaines et prévenir les crimes tout en respectant les droits des citoyens.\n\n'
          '• Santé Connectée : Développer des solutions intelligentes pour améliorer l\'accessibilité et la qualité des soins.',
    );
  }

  Widget _buildLogoCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Signification du Logo',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text in white
                ),
              ),
              const SizedBox(height: 16),
              Center( // Center the logo image
                child: ClipOval( // Clip the image into a circular shape
                  child: Container(
                    width: 170, // Circle width
                    height: 170, // Circle height
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color (optional)
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Shadow color
                          spreadRadius: 2, // Spread radius of the shadow
                          blurRadius: 5, // Blur radius of the shadow
                          offset: const Offset(0, 3), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: Padding( // Add padding around the image
                      padding: const EdgeInsets.all(2.0), // Adjust padding for size
                      child: Center( // Center the image within the padding
                        child: Image.asset(
                          'assets/logosecond.png', // Path to the logo asset
                          fit: BoxFit.cover, // Scale image appropriately
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Notre logo symbolise l\'engagement du parti envers l\'innovation durable et l\'harmonie entre la technologie et l\'environnement. '
                    'Le vert représente la nature, la durabilité et le progrès écologique, tandis que le bleu symbolise la stabilité, la confiance et '
                    'la fiabilité. Cette combinaison de couleurs reflète l\'équilibre entre des politiques avant-gardistes et une gouvernance stable.',
                style: TextStyle(fontSize: 16, color: Colors.white70), // Light text color,
                textAlign: TextAlign.justify
              ),
            ],
          ),
        ),
        color: const Color(0xFF093B56), // Card background color
      ),
    );
  }

  // Helper method to build a card with title and content
  Widget _buildCard({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text in white
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16, color: Colors.white70), // Light text color
              ),
            ],
          ),
        ),
        color: const Color(0xFF093B56), // Card background color
      ),
    );
  }
}
