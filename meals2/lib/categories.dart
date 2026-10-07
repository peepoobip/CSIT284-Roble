import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        children: const [
          Center(
            child: Text(
              'Category 1',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Category 2',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Category 3',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Category 4',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Category 5',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Category 6',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}