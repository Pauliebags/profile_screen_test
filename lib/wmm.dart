import 'package:flutter/material.dart';

class WMM extends StatefulWidget {
  const WMM({Key? key}) : super(key: key);

  @override
  _WMMState createState() => _WMMState();
}

class _WMMState extends State<WMM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: const Text('World Media Monitor'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: Image.network(
          'https://images.unsplash.com/photo-1533035353720-f1c6a75cd8ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z3JleXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
