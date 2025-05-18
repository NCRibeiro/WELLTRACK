import 'package:flutter/material.dart';
import '../services/mood_storage.dart';


class AddMoodScreen extends StatefulWidget {
  const AddMoodScreen({super.key});

  @override
  State<AddMoodScreen> createState() => _AddMoodScreenState();
}


class _AddMoodScreenState extends State<AddMoodScreen> {
  final TextEditingController _controller = TextEditingController();


  Future<void> _saveMood() async {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      await MoodStorage.save(text);
      if (!mounted) return;
      Navigator.pop(context, text);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar humor')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Como você está se sentindo?',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Digite aqui...'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveMood,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
