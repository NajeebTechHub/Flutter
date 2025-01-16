import 'dart:io';

class vehicle {
  String model;
  int cc;

  vehicle(this.model, this.cc);

  consumption() {
    return cc * 0.001;
  }

  speed(double distance, double time) {
    return distance / time;
  }

  show() {
    print('Enter your distance traveled in km : ');
    double distance = double.parse(stdin.readLineSync()!);

    print('Enter time taken : ');
    double time = double.parse(stdin.readLineSync()!);

    double cons = consumption();
    double sp = speed(distance, time);

    print('The model of yoer Car is : $model');
    print('The engine displacement is : $cc CC');
    print('The fuel consumption is : $cons litter/km');
    print('The speed is : $sp km/h');
  }
}

void main() {
  print('Enter your car model : ');
  String model = stdin.readLineSync()!;

  print('Enter your car engine displacement : ');
  int cc = int.parse(stdin.readLineSync()!);

  vehicle obj = vehicle(model, cc);

  obj.show();
}
