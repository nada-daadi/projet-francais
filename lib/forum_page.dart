import 'package:flutter/material.dart';
import 'add_forum_post_page.dart'; // Import the new page

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
        title: const Text('Forum Citoyen'),
        backgroundColor: Colors.teal,
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
      body: Padding(
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
    );
  }

  Widget _buildPostCard(String title, String content, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Commentaire sur "$title" ajouté!')),
            );
          },
          child: const Text('Commenter'),
        ),
      ),
    );
  }
}
