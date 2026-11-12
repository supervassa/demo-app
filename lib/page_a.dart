import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page A"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Selamat Datang di Page A")
          ],
        ),
      ),
    );
  }
}
