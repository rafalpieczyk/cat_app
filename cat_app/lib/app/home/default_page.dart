import 'package:cat_app/app/appbar/cat_bar.dart';
import 'package:cat_app/app/home/add_info_page/add_info_page_content.dart';
import 'package:cat_app/app/home/my_account_page/my_account_page_content.dart';
import 'package:cat_app/app/home/my_cat_page/my_cat_page_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: CatBar(),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const MyCatPageContent();
        }
        if (currentIndex == 1) {
          return AddInfoPageContent(onSave: () {
            setState(() {
              currentIndex = 0;
            });
          });
        }
        return MyAccountPageContent(widget: widget);
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: Colors.brown,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pets_outlined,
                ),
                label: 'Mój kot'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: 'Dodaj'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Moje konto'),
          ]),
    );
  }
}
