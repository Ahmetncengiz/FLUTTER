import 'dart:math';

void main(List<String> args) {
  Random rnd = Random();
  int a = rnd.nextInt(100);

  if (!(false && true || true && a == 3) || false) {
    print("true ");
  } else {
    print("false ");
  }

  if (a % 2 == 0) {
    print("$a bi rçift sayıdır");
  } else {
    print("$a bir tek sayıdır");
  }

  if (a % 2 == 0) {
    print("$a bi rçift sayıdır");
  } else {
    print("$a bir tek sayıdır");
  }

  a % 2 == 0 ? print("$a bir çift sayıdır ") : print("$a bir tek sayıdır");
}
