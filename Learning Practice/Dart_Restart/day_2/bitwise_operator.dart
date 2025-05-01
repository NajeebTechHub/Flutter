import 'dart:io';

void main() {
  // int jump = 1;
  // int run = 2;
  // int shoot = 4;
  // int fly = 8;

  // stdout.write('enter player power number : ');
  // String? input = stdin.readLineSync();
  // if (input != null && input.isNotEmpty) {
  //   int playerPower = int.tryParse(input) ?? 0;

  //   if ((playerPower & jump) != 0) {
  //     print('player can jump');
  //   } else {
  //     print('can\'t jump');
  //   }
  //   if (playerPower & run != 0) {
  //     print('player can run');
  //   } else {
  //     print('can\'t run');
  //   }
  //   if (playerPower & shoot != 0) {
  //     print('player can shoot');
  //   } else {
  //     print('can\'t shoot');
  //   }
  //   if (playerPower & fly != 0) {
  //     print('player can fly');
  //   } else {
  //     print('can\'t fly');
  //   }
  // }

  skillSimulator(3, 'fire_immutability');
}

void skillSimulator(int position, String skillName) {
  // int strength = 0;
  // int speed = 1;
  // int invisiblity = 2;
  // int fire_immutnity = 3;
  // int water_breathing = 4;
  // int flying = 5;
  // int mind_reading = 6;
  // int time_travel = 7;

  stdout.write('enter base skill from 0 to 255 : ');
  String? input = stdin.readLineSync();
  if (input != null && input.isNotEmpty) {
    int baseSkill = int.parse(input);

    if (baseSkill & (1 << position) != 0) {
      print('$skillName exist');
    } else {
      print('$skillName can\'t exist');
    }
  }
}
