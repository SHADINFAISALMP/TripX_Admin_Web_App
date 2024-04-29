import 'package:flutter/material.dart';
import 'package:tripx_admin_application/utils/colors.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: colorteal,
      body: Text("search"),);
  }
}