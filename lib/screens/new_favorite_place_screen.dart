import 'dart:io';
import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewFavoritePlaceScreen extends ConsumerStatefulWidget {
  const NewFavoritePlaceScreen({super.key});

  @override
  ConsumerState<NewFavoritePlaceScreen> createState() =>
      _NewFavoritePlaceScreenState();
}

class _NewFavoritePlaceScreenState
    extends ConsumerState<NewFavoritePlaceScreen> {
  final titleController = TextEditingController();
  File? _selectedImage;

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new place')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text('Title')),
              style: const TextStyle(color: Colors.white),
              controller: titleController,
            ),
            const SizedBox(height: 10),

            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 12),

            FilledButton.icon(
              label: const Text('Add Place'),
              icon: const Icon(Icons.add),
              onPressed: () {
                if (titleController.text.isEmpty || _selectedImage == null) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please enter a title and select an image!',
                      ),
                    ),
                  );
                  return;
                }
                ref
                    .read(favoritePlaceProvider.notifier)
                    .addPlace(titleController.text, _selectedImage!);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Place added!')));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
