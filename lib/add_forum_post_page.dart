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
        title: const Text(
          'Ajouter un Post',
          style: TextStyle(color: Colors.white), // White text
        ),
        backgroundColor: const Color(0xFF093B56),
        iconTheme: const IconThemeData(color: Colors.white),// White back icon
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Titre',
                labelStyle: TextStyle(color: Color(0xFF093B56)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Contenu',
                labelStyle: TextStyle(color: Color(0xFF093B56)),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF093B56), // Blue button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Ajouter Post',
                style: TextStyle(color: Colors.white), // White text on button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
