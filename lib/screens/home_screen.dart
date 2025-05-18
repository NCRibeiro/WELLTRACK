import 'package:flutter/material.dart';
import 'add_mood_screen.dart';
import '../services/mood_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> moods = [];

  @override
  void initState() {
    super.initState();
    _loadMoods();
  }

  Future<void> _loadMoods() async {
    final entries = await MoodStorage.load();
    setState(() {
      moods = entries.reversed.toList(); // mais recentes primeiro
    });
  }

  Future<void> _navigateAndAddMood() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddMoodScreen()),
    );

    if (result != null && result is String) {
      await _loadMoods();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Humor registrado: $result')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WellTrack'),
      ),
      body: moods.isEmpty
          ? const Center(child: Text('Nenhum registro de humor ainda.'))
          : ListView.builder(
              itemCount: moods.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.emoji_emotions),
                  title: Text(moods[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAndAddMood,
        child: const Icon(Icons.add),
      ),
    );
  }
}
