import 'package:flutter/material.dart';

class BookListScreen extends StatelessWidget {
  final String ageGroup;
  final String format;

  const BookListScreen({
    super.key,
    required this.ageGroup,
    required this.format,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$ageGroup — ${format.toUpperCase()}'),
      ),
      body: const Center(
        child: Text(
          'Book list coming soon.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
