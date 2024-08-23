// ignore_for_file: prefer_const_constructors

import 'package:best_quotes/main.dart';
import 'package:flutter/material.dart';

class CardsWdg extends StatelessWidget {
  final String author;
  final String title;
  final Function delete;
  final Quotes item;

  const CardsWdg(
      {super.key,
      required this.author,
      required this.title,
      required this.delete,
      required this.item
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(11),
      color: const Color.fromARGB(255, 46, 69, 104),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 27),
              textDirection: TextDirection.rtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      delete(item);
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 27,
                      color: const Color.fromARGB(255, 158, 34, 34),
                    )),
                Text(
                  author,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
