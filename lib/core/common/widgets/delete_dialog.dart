import 'package:flutter/material.dart';

Future<void> showDeleteConfirmationDialog(
    BuildContext context, VoidCallback onConfirm) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text('Confirm Deletion',
            style: Theme.of(context).textTheme.headlineSmall),
        content: Text(
          'Are you sure you want to delete this item? This action cannot be undone.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:
                Text('Cancel', style: Theme.of(context).textTheme.labelLarge),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              onConfirm(); // Perform deletion action
            },
            child: Text('Delete',
                style: TextStyle(color: Theme.of(context).colorScheme.onError)),
          ),
        ],
      );
    },
  );
}
