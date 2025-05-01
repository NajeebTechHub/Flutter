mixin PrintHelper {
  void printData(String data) {
    print('data : $data');
  }
}

class document with PrintHelper {
  void displayDoc() {
    var docName = 'student.ppt';
    var docData = 'Student Data';
    printData('Document Name : $docName, Data : $docData');
  }
}

void main() {
  var d = document();
  d.displayDoc();
}
