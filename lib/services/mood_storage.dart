import 'package:shared_preferences/shared_preferences.dart';

class MoodStorage {
  static const _key = 'mood_entries';

  static Future<void> save(String newEntry) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> existing = prefs.getStringList(_key) ?? [];
    existing.add(newEntry);
    await prefs.setStringList(_key, existing);
  }

  static Future<List<String>> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }
}
