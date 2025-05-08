class Book {
  String title;
  String author;
  String isbn;
  bool isAvailable;

  Book(this.title, this.author, this.isbn, this.isAvailable);

  @override
  String toString() {
    return '''

Title       : $title
Author      : $author
ISBN        : $isbn
IsAvailable : $isAvailable
''';
  }
}

class Library {
  List<Book> bookList = [];

  void addBook(Book obook) {
    for (var book in bookList) {
      if (obook.isbn == book.isbn) {
        print('Book Already Exist');
        return;
      }
    }
    bookList.add(obook);
  }

  void borrowBook(String inputISBN) {
    try {
      for (var book in bookList) {
        if (book.isbn == inputISBN) {
          if (book.isAvailable) {
            book.isAvailable = false;
            print('Book Borrowed Successfully! ISBN : ${book.isbn}\n');
            return;
          } else {
            throw Exception('Book Already Borrowed ISBN : ${book.isbn}\n');
          }
        }
      }
      throw Exception('Book not found\n');
    } catch (e) {
      print('Error : $e');
    }
  }

  void returnBook(String isbn) {
    for (var book in bookList) {
      if (book.isbn == isbn) {
        book.isAvailable = true;
        print('Book Return Successfully! ISBN : ${book.isbn}\n');
      }
    }
  }

  void showInventory() {
    print(bookList.toString());
  }

  void removeBook(String inputISBN) {
    bookList.removeWhere((book) => book.isbn == inputISBN);
    print('Book Removed Successfully! ISBN : $inputISBN\n');
  }

  void searchByTitle(String title) {
    for (var book in bookList) {
      if (book.title.toLowerCase() == title.toLowerCase()) {
        print(book.toString());
      }
    }
  }
}

void main() {
  var lib = Library();
  lib.addBook(Book('programming', 'najeeb', '576', true));
  lib.addBook(Book('C++', 'haseeb', '354', true));
  lib.addBook(Book('DSA', 'anees', '908', false));
  lib.addBook(Book('JAVA', 'tariq', '465', true));

  print('---Borrow Book---');
  lib.borrowBook('354');

  print('---Return Book---');
  lib.returnBook('908');

  print('---Search By Title---');
  lib.searchByTitle('java');

  print('---Remove Book---');
  lib.removeBook('465');

  print('---Show Inventory---');
  lib.showInventory();
}
