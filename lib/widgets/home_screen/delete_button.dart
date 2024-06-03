// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripx_admin_application/utils/colors.dart';

class Deletebutton extends StatelessWidget {
  const Deletebutton({
    super.key,
    required this.item,
  });

  final QueryDocumentSnapshot<Object?> item;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 35,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: whitecolor,
              title: const Text(
                "Delete Package",
                style: TextStyle(color: colorteal),
              ),
              content: const Text(
                "Are you sure you want to delete this package?",
                style: TextStyle(color: colorteal),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: colorteal),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      await item.reference.delete();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Package deleted successfully'),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                              'Failed to delete package: $e'),
                        ),
                      );
                    }
    
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}