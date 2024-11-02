import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_details_page.dart';

class ByAuthorPage extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: "1984",
      author: "George Orwell",
      plot: "A dystopian novel set in a totalitarian society...",
      genre: "Dystopian, Political Fiction",
      imagePath: 'assets/images/1984.png',
    ),
    Book(
      title: "The Catcher in the Rye",
      author: "J.D. Salinger",
      plot: "The story of a teenager Holden Caulfield...",
      genre: "Fiction, Coming-of-age",
      imagePath: 'assets/images/catcher_in_the_rye.png',
    ),
    Book(
      title: "The Great Gatsby",
      author: "F. Scott Fitzgerald",
      plot: "A story about the jazz age in the United States...",
      genre: "Classic, Tragedy",
      imagePath: 'assets/images/great_gatsby.png',
    ),
    Book(
      title: "Pride and Prejudice",
      author: "Jane Austen",
      plot: "A romantic novel that also critiques societal norms...",
      genre: "Romantic Fiction, Classic",
      imagePath: 'assets/images/pride_and_prejudice.png',
    ),
    Book(
      title: "To Kill a Mockingbird",
      author: "Harper Lee",
      plot: "A novel about the moral growth of Scout Finch...",
      genre: "Classic, Legal Story",
      imagePath: 'assets/images/to_kill_a_mockingbird.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Copy and sort books by author
    final sortedBooks = List<Book>.from(books)..sort((a, b) => a.author.compareTo(b.author));

    return Scaffold(
      appBar: AppBar(title: Text("Books by Author")),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.6,
        ),
        itemCount: sortedBooks.length,
        itemBuilder: (context, index) {
          final book = sortedBooks[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsPage(book: book),
                ),
              );
            },
            child: Column(
              children: [
                Image.asset(book.imagePath, fit: BoxFit.cover, height: 150),
                SizedBox(height: 8),
                Text(book.title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(book.author),
              ],
            ),
          );
        },
      ),
    );
  }
}
