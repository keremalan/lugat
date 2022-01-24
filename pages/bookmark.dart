import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:lugat/main.dart';
import '../widgets/texts.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#FFFFFF'),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: LugatAppBar(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            HeadlineText('Kaydettiklerim', '#000000'),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text("Kayıtlı bir teriminiz bulunmuyor.",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4)
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LugatAppBarBookmark extends StatelessWidget
    implements PreferredSizeWidget {
  LugatAppBarBookmark({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.only(left: 12),
        child: Text(
          "Kaydettiklerim",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

Widget DescriptionText(descText) {
  return Text(
    "$descText".toUpperCase(),
    style: TextStyle(
      fontSize: 12,
      height: 0.2,
      color: HexColor('#BFBFBF'),
    ),
  );
}