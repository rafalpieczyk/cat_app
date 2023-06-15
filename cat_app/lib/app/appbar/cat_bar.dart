import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(45),
      child: CatBar(),
    );
  }
  
  @override
  Size get preferredSize => throw UnimplementedError();
}
class CatBar extends StatelessWidget {
  const CatBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'CatApp demo',
        style: GoogleFonts.poppins(),
      ),
      backgroundColor: Colors.brown,
    );
  }
}
