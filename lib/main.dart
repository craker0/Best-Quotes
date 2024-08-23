// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters

import 'package:best_quotes/widgets/Cards.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: BestQuotes(),
    );
  }
}

class BestQuotes extends StatefulWidget {
  const BestQuotes({super.key});

  @override
  State<BestQuotes> createState() => _BestQuotesState();
}

// class to define title && author to Quotes
class Quotes {
  String title;
  String author;

  Quotes({required this.author, required this.title});
}

class _BestQuotesState extends State<BestQuotes> {
  // List fo all Quotes
  List allQuotes = [
    Quotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    Quotes(author: "Ali 7assan", title: "العقل السليم في البعد عن الحريم 😂"),
    Quotes(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    Quotes(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];
// funcation to delete cards {in CardsWdg}
  delete(Quotes item) {
    setState(() {
      allQuotes.remove(item);
    });
  }

// funcation to add new Quote
  addNewQuote() {
    setState(() {
      allQuotes
          .add(Quotes(author: myController2.text, title: myController.text));
    });
  }

// define each controller to textfield {in floating button}
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 60,
                        decoration:
                            InputDecoration(hintText: "Write Your Quote"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: myController2,
                        maxLength: 20,
                        decoration: InputDecoration(hintText: "Author Name"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            addNewQuote();
                            Navigator.pop(context);
                          },
                          child: Text("ADD"))
                    ],
                  ),
                );
              });
        },
        backgroundColor: const Color.fromARGB(255, 64, 135, 145),
        child: Icon(
          Icons.add_card_sharp,
          size: 30,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 51, 99),
        centerTitle: true,
        title: Text(
          "Best Quotes",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // call cards.dart to view CardsWdg
          ...allQuotes.map((item) => CardsWdg(
              item: item,
              delete: delete,
              title: item.title,
              author: item.author))
        ]),
      ),
    );
  }
}
