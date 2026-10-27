import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RestApiScreen extends StatefulWidget {
  const RestApiScreen({super.key});
  @override
  State<RestApiScreen> createState() => _RestApiScreenState();
}

class _RestApiScreenState extends State<RestApiScreen> {
  late Future<Map<String, dynamic>> post;
  @override
  void initState() { super.initState(); post = ApiService.fetchSamplePost(); }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Stage 9 — REST API')),
    body: Center(child: Padding(padding: const EdgeInsets.all(20),
      child: FutureBuilder<Map<String, dynamic>>(
        future: post,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const CircularProgressIndicator();
          if (snapshot.hasError) return Column(mainAxisSize: MainAxisSize.min, children: [
            Text('Could not load API data.\n${snapshot.error}', textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton(onPressed: () => setState(() => post = ApiService.fetchSamplePost()), child: const Text('Retry')),
          ]);
          final data = snapshot.data!;
          return Card(child: Padding(padding: const EdgeInsets.all(20), child: Column(
            mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Post #${data['id']}'),
              const SizedBox(height: 8),
              Text('${data['title']}', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('${data['body']}'),
              const SizedBox(height: 12),
              OutlinedButton(onPressed: () => setState(() => post = ApiService.fetchSamplePost()), child: const Text('Reload')),
            ],
          )));
        },
      ),
    )),
  );
}
