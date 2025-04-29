var integer = 4;
int integer2 = 7;

var decimal = 3.7;
double decimal1 = 5.7;

var str = 'hello';
String str1 = 'world';

var isLogin = false;
bool isString = true;

var list1 = ['najeeb', 3, 3.4, true, 'mardan'];
List list2 = [
  'haseeb',
  'tariq',
  ['anees', 4],
  {
    'names': ['najeeb', 'haseeb', 'anees'],
    'marks': [2, 5, 6]
  }
];

void main() {
  print('var : ${integer}, int : ${integer2}');
  print('var : ${decimal}, double : ${decimal1}');
  print('var : ${str}, String : ${str1}');
  print('var : ${isLogin}, bool : ${isString}');
  print('var : ${list1}, List : ${list2}');

  print('accessing list elements');
  print(
      'first : ${list1[0]}, \nsecond : ${list1[1]}, \nlist2 index2 : ${list2[2][1]}, \nlist2 index3 : ${list2[3]['names']}');

  print('list manipulation');
  list1.add(6);
  print(list1);
  list1.remove(3.4);
  print(list1);
  list1[1] = 4;
  print(list1);

  print(list1.length);
  print(list1.reversed);
  print(list1.isEmpty);

  print('basic operation');
  print(integer + integer2);
  print(decimal - integer);
  print(decimal1 * integer2);
  print(integer / integer2);

  print('comparison operation');
  print(integer < integer2);
  print(decimal == integer);
  print(decimal <= decimal1);
  print(integer2 >= integer);
  print(integer != integer2);

  print(integer != 3 && integer2 < 50);
  print(integer == 2 || integer2 < 100);
}
