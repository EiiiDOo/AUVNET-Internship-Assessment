import 'package:flutter/material.dart';

class DeliverTab extends StatefulWidget {
  const DeliverTab({super.key});

  @override
  State<DeliverTab> createState() => _DeliverTabState();
}

class _DeliverTabState extends State<DeliverTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Deliver Screen")));
  }
}
