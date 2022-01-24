import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:lugat/categories/ai_category.dart';
import 'package:lugat/categories/back_end_category.dart';
import 'package:lugat/categories/design_category.dart';
import 'package:lugat/categories/front_end_category.dart';
import 'package:lugat/categories/game_dev_category.dart';
import 'package:lugat/categories/metaverse_category.dart';
import 'package:lugat/categories/others_category.dart';
import 'package:lugat/categories/software_category.dart';
import 'package:lugat/categories/ui_category.dart';
import 'package:lugat/categories/ux_category.dart';
import 'package:lugat/main.dart';
import '../widgets/cards.dart';
import 'package:sizer/sizer.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#FFFFFF'),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
            child: Column(
              children: [
                LugatAppBar(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DesignCategory(),
                            ));
                          },
                          child: ExploreCategoryCard('Tasarım',
                              "https://www.upload.ee/image/13731805/designCategory.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MetaverseCategory(),
                            ));
                          },
                          child: ExploreCategoryCard('Metaverse',
                              "https://www.upload.ee/image/13757839/metaverse.png"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => FrontendCategory(),
                          ));
                        },
                        child: ExploreCategoryCard('Front-end',
                            "https://www.upload.ee/image/13757844/front-end.png"),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: DescriptionText('Yeni terimler'),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FrontendCategory()));
                    },
                    child: CategoryTitle('Front-end')),
                FrontEndCategoryOverview(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BackendCategory()));
                    },
                    child: CategoryTitle('Back-end')),
                BackEndCategoryOverview(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UiCategory()));
                    },
                    child: CategoryTitle('UI')),
                UICategoryOverview(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UxCategory()));
                    },
                    child: CategoryTitle('UX')),
                UXCategoryOverview(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MetaverseCategory()));
                    },
                    child: CategoryTitle('Metaverse')),
                MetaverseCategoryOverview(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AiCategory()));
                    },
                    child: CategoryTitle('Yapay Zeka')),
                AiCategoryOverview(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OthersCategory()));
                    },
                    child: CategoryTitle('Diğer Terimler')),
                OthersCategoryOverview(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SoftwareCategory()));
                    },
                    child: CategoryTitle('Yazılım')),
                SoftwareCategoryOverview(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DesignCategory()));
                    },
                    child: CategoryTitle('Tasarım')),
                DesignCategoryOverview(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GameDevCategory()));
                  },
                  child: CategoryTitle('Oyun Geliştirme'),
                ),
                GameDevCategoryOverview(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LugatAppBarExplore extends StatelessWidget
    implements PreferredSizeWidget {
  LugatAppBarExplore({Key? key}) : super(key: key);

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
          "Keşfet",
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

Widget SearchBar(placeHold) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 91.2.w,
        height: 40,
        child: CupertinoSearchTextField(
          placeholder: "$placeHold",
          onChanged: (String value) {
            print('The text has changed to: $value');
          },
          onSubmitted: (String value) {
            print('Submitted text: $value');
          },
        ),
      ),
    ],
  );
}
