void main() {
  // Emplicit Declaration of list
  var student_data = ['Najeeb', 23, 3.88, true];

  // printing values along with data type
  for (var data in student_data) {
    print('Element : $data of type ${data.runtimeType}');
  }
}
