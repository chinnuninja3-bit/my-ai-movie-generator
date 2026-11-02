import 'package:flutter/material.dart';

void main() {
  runApp(const MovieGeneratorApp());
}

class MovieGeneratorApp extends StatelessWidget {
  const MovieGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF0B1020);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My AI Movie Generator',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5CF6),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF171F35),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const MovieHomePage(),
    );
  }
}

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  final TextEditingController _promptController = TextEditingController();
  String _language = 'Telugu';
  String _status =
      'Your movie workspace is ready. Connect a secure AI backend to generate a real movie.';
  bool _requestPrepared = false;

  // This is a starter list, not literally every language in the world.
  // Add more languages when the connected voice/video providers support them.
  final List<String> _languages = const [
    'Telugu', 'Hindi', 'English', 'Tamil', 'Kannada', 'Malayalam',
    'Bengali', 'Marathi', 'Gujarati', 'Punjabi', 'Urdu', 'Odia',
    'Assamese', 'Spanish', 'French', 'German', 'Italian', 'Portuguese',
    'Japanese', 'Korean', 'Chinese', 'Arabic', 'Russian', 'Indonesian',
    'Thai', 'Vietnamese', 'Turkish', 'Other / choose later',
  ];

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _prepareMovieRequest() {
    final prompt = _promptController.text.trim();
    if (prompt.isEmpty) {
      setState(() {
        _status = 'Please describe your movie first.';
        _requestPrepared = false;
      });
      return;
    }

    setState(() {
      _requestPrepared = true;
      _status =
          'Your 3-hour movie request is prepared. Real generation is not connected yet. A secure backend and AI video, voice, music and editing services must be connected before a movie can be created.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY AI MOVIE GENERATOR',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        centerTitle: true,
        backgroundColor: const Color(0xFF111A2E),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  colors: [Color(0xFF34206D), Color(0xFF172B50)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.movie_creation_outlined, size: 38),
                  SizedBox(height: 12),
                  Text('Your story. A complete movie.',
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold)),
                  SizedBox(height: 7),
                  Text(
                    'Plan a 3-hour movie with scenes, character voices, music and sound effects.',
                    style: TextStyle(color: Colors.white70, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text('1. Describe your movie',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: _promptController,
              minLines: 5,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText:
                    'Example: A thrilling fantasy adventure about a lost kingdom...',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 20),
            const Text('2. Movie duration',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF171F35),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  Icon(Icons.timer_outlined, color: Color(0xFFC4B5FD)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text('3 hours (180 minutes)',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  Chip(label: Text('FIXED')),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('3. Movie language',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _language,
              isExpanded: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.language),
              ),
              items: _languages
                  .map((language) => DropdownMenuItem(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => _language = value);
              },
            ),
            const SizedBox(height: 20),
            const Text('4. Automatic movie features',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const FeatureTile(
                icon: Icons.video_library_outlined,
                title: 'AI-generated video scenes'),
            const FeatureTile(
                icon: Icons.record_voice_over_outlined,
                title: 'Character dialogue and voice-overs'),
            const FeatureTile(
                icon: Icons.music_note_outlined,
                title: 'Background music and sound effects'),
            const FeatureTile(
                icon: Icons.sync_outlined,
                title: 'Lip-sync and automatic editing'),
            const SizedBox(height: 22),
            FilledButton.icon(
              onPressed: _prepareMovieRequest,
              icon: const Icon(Icons.movie_filter_outlined),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('PREPARE 3-HOUR MOVIE',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF171F35),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF35415D)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline, color: Color(0xFFC4B5FD)),
                      SizedBox(width: 8),
                      Text('Production status',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Text(_status, style: const TextStyle(height: 1.45)),
                  if (_requestPrepared) ...[
                    const SizedBox(height: 10),
                    const Text(
                      'Request details are ready in this app. No video has been generated.',
                      style: TextStyle(
                          color: Color(0xFFFBBF24),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Important: This starter app is the user interface only. It does not yet generate video, voices or music. Those features require a secure cloud backend and connected AI providers. Never put private API keys directly in this Android app.',
              style: TextStyle(color: Colors.white60, fontSize: 12, height: 1.5),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF171F35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFC4B5FD)),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
          const Icon(Icons.check_circle_outline,
              color: Color(0xFF86EFAC), size: 19),
        ],
      ),
    );
  }
}
