import 'package:flutter/material.dart';

class AddForumPostPage extends StatefulWidget {
  final Function(String title, String content) onPostAdded; // Callback for post addition

  const AddForumPostPage({super.key, required this.onPostAdded});

  @override
  // ignore: library_private_types_in_public_api
  _AddForumPostPageState createState() => _AddForumPostPageState();
}

class _AddForumPostPageState extends State<AddForumPostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _submitPost() {
    String title = _titleController.text;
    String content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      widget.onPostAdded(title, content); // Call the callback function
      Navigator.pop(context); // Go back to ForumPage
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un Post'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Titre',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Contenu',
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: const Text('Ajouter Post'),
            ),
          ],
        ),
      ),
    );
  }
}
