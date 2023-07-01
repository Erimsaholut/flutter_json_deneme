import 'package:flutter/material.dart';
import 'messageBaloon.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> dialogs = [];

  Future<void> loadJson() async {
    String jsonData = await rootBundle.loadString('assets/sample.json');
    Map<String, dynamic> data = json.decode(jsonData);
    dialogs = data['dialogs'];

    for (var dialog in dialogs) {
      persons.add(dialog['isim']);
    }
  }

  void printItemDescription(String id) {
    dynamic item =
        dialogs.firstWhere((item) => item['isim'] == id, orElse: () => null);
    if (item != null) {
      setState(() {
        String description = item['message'];
        String numara = item['numara'];
        baloons
            .add(MessageBalloon(isim: id, telNo: numara, message: description));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadJson().then((_) {
      printItemDescription('p2');
    });
  }

  List<String> persons = [];
  int personTurn = 0;
  List<Widget> baloons = [
    const MessageBalloon(
      isim: "deneme",
      telNo: "2331",
      message: "Merhaba ben whatsapp kullanıyorum",
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Matssapp'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.green.shade200),
        child: ListView(children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      printItemDescription(
                          persons[personTurn % persons.length]);
                      personTurn++;
                    },
                    child: const Text(
                      "New message",
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      setState(() {
                        baloons.clear();
                        personTurn = 0;
                      });
                    },
                    child: const Text(
                      "Reset Chat",
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ...baloons,
        ]),
      ),
    );
  }
}
