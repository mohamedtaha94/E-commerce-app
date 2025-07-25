
import 'package:e_commerce/presentation/home/widgets/header.dart';
import 'package:e_commerce/presentation/home/widgets/new_in.dart';
import 'package:e_commerce/presentation/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';

import '../widgets/categories.dart';
import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 24,),
            SearchField(),
            SizedBox(height: 24,),
            Categories(),
            SizedBox(height: 24,),
            TopSelling(),
            SizedBox(height: 24,),
            NewIn()
          ],
        ),
      ),
    );
  }
}