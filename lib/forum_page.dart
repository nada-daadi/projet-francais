import 'package:flutter/material.dart';
import 'add_forum_post_page.dart'; // Import the new page
import 'dart:ui'; // For ImageFilter.blur

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final List<Map<String, String>> _posts = []; // List to hold forum posts

  void _addPost(String title, String content) {
    setState(() {
      _posts.add({
        'title': title,
        'content': content,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forum Citoyen',
          style: TextStyle(color: Colors.white), // Text color in white
        ),
        backgroundColor: const Color(0xFF093B56), // Green color for the app bar
        iconTheme: const IconThemeData(
          color: Colors.white, // Add icon in white
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddForumPostPage(
                    onPostAdded: _addPost, // Pass the callback
                  ),
                ),
              );
            },
          ),
        ],
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
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return _buildPostCard(
                  _posts[index]['title']!,
                  _posts[index]['content']!,
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(String title, String content, BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color in white
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70, // Light white for content
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Commentaire sur "$title" ajouté!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Commenter', style: TextStyle(color: Colors.black)), // Text in black
              ),
            ],
          ),
        ),
      ),
    );
  }
}
