import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(book.imagePath, height: 200),
            ),
            SizedBox(height: 16),
            Text("Title: ${book.title}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Author: ${book.author}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Genre: ${book.genre}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text("Plot:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(book.plot, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
