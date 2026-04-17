import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewFavoritePlaceScreen extends ConsumerWidget {
  const NewFavoritePlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add a new place')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text('Title')),
              style: TextStyle(color: Colors.white),
              controller: titleController,
            ),
            SizedBox(height: 12),
            FilledButton.icon(
              label: const Text('Add Place'),
              icon: Icon(Icons.add),
              onPressed: () {
                ref
                    .read(favoritePlaceProvider.notifier)
                    .addPlace(titleController.text);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Place added!')));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
