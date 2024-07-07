import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/storage_service.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storageService = Provider.of<StorageService>(context);
    final TextEditingController apiKeyController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: apiKeyController,
              decoration: InputDecoration(
                labelText: 'OpenAI API Key',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await storageService.saveApiKey(apiKeyController.text);
                String message = success ? 'API Key saved successfully!' : 'Failed to save API Key!';
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
