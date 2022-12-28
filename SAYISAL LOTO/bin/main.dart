import 'dart:math';

void main(List<String> args) {
  List<int> sayilar = [5, 1, 2, 3, 4, 6];
  List<int> kasaSayilar = [];
  int tahmin = 0;
  for (var i = 0; i < 6; i++) {
    kasaSayilar.add(Random().nextInt(6));
  }

  for (var i = 0; i < sayilar.length; i++) {
    for (var j = 0; j < kasaSayilar.length; i++) {
      sayilar[i] == kasaSayilar[j] ? tahmin++ : null;
    }    
  }
  print("$tahmin adet sayı tutdurdun bahtsız pezevenk");
  print("Kasanin Sayıları : ${kasaSayilar.toString()}");
}
