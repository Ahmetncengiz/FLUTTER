import 'package:flutter/material.dart';
import 'package:myapp/Say%C4%B1salLoto.dart';
import 'package:myapp/metin_font.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _FontSizeChangerState(),
    );
  }
}

/*class FontSizeList extends StatelessWidget {
  final List<double> fontSizes = [12, 16, 20, 24, 28, 32];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size List'),
      ),
      body: ListView.builder(
        itemCount: fontSizes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'The quick brown fox jumps over the lazy dog',
              style: TextStyle(fontSize: fontSizes[index]),
            ),
          );
        },
      ),
    );
  }
}

class FontSizeSlider extends StatefulWidget {
  @override
  _FontSizeSliderState createState() => _FontSizeSliderState();
}

class _FontSizeSliderState extends State<FontSizeSlider> {
  double _fontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Slider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The quick brown fox jumps over the lazy dog',
              style: TextStyle(fontSize: _fontSize),
            ),
            SizedBox(height: 20),
            Slider(
              value: _fontSize,
              min: 12,
              max: 40,
              divisions: 28,
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _text = '';

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _text = _textEditingController.text;
    });
  }

  void _saveText() {
    // Burada metnin kaydedilmesi işlemi yapılabilir
    print('Kaydedilen Metin: $_text');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Metin Kaydedildi'),
          content: Text('Metin başarıyla kaydedildi!'),
          actions: [
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metin Düzenleyici'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveText,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: 'Metin yazın',
          ),
          maxLines: null,
          keyboardType: TextInputType.multiline,
        ),
      ),
    );
  }
}
*/
class NotlarSayfasi extends StatefulWidget {
  @override
  _NotlarSayfasiState createState() => _NotlarSayfasiState();
}

class _NotlarSayfasiState extends State<NotlarSayfasi> {
  final List<String> _notlar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Defteri'),
      ),
      body: ListView.builder(
        itemCount: _notlar.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_notlar[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _notlar.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              final TextEditingController _textEditingController =
                  TextEditingController();
              return AlertDialog(
                title: Text('Not Ekle'),
                content: TextField(
                  controller: _textEditingController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Notunuzu buraya girin...',
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text('İptal'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Ekle'),
                    onPressed: () {
                      setState(() {
                        _notlar.add(_textEditingController.text);
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  String message = '';
  int bakiye = 0;

  void oyna() {
    List<int> randomNumbers = List.generate(6, (_) => Random().nextInt(60) + 1);
    List<int> inputs = controllers
        .map((controller) => int.tryParse(controller.text) ?? 0)
        .toList();

    int correct = 0;
    for (int i = 0; i < 6; i++) {
      if (randomNumbers.contains(inputs[i])) {
        correct++;
      }
    }

    int odul = 0;
    switch (correct) {
      case 1:
        odul = 4;
        break;
      case 2:
        odul = 8;
        break;
      case 3:
        odul = 16;
        break;
      case 4:
        odul = 32;
        break;
      case 5:
        odul = 64;
        break;
      case 6:
        odul = 128;
        break;
      default:
        odul = 0;
    }

    setState(() {
      message = 'Tuttuğunuz sayılar: ${inputs.join(', ')}\n';
      message += 'Doğru sayılar: ${randomNumbers.join(', ')}\n';
      message += 'Tahmininizde ${correct} doğru cevap var.\n';
      message += 'Kazandığınız ödül: ${odul}';
      bakiye += odul;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Şans Oyunu'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 6; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controllers[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '${i + 1}. sayıyı girin',
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: oyna,
                child: Text('Oyna'),
              ),
              SizedBox(height: 16.0),
              Text(message),
              SizedBox(height: 16.0),
              Text('Bakiye: $bakiye'),
            ],
          ),
        ),
      ),
    );
  }
}
*/