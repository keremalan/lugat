import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:lugat/categories/ai_category.dart';
import 'package:lugat/categories/back_end_category.dart';
import 'package:lugat/categories/design_category.dart';
import 'package:lugat/categories/front_end_category.dart';
import 'package:lugat/categories/metaverse_category.dart';
import 'package:lugat/categories/software_category.dart';
import 'package:lugat/categories/ui_category.dart';
import 'package:lugat/categories/ux_category.dart';
import 'package:lugat/pages/album.dart';
import 'package:lugat/pages/bookmark.dart';
import 'package:lugat/pages/category.dart';
import 'package:lugat/pages/explore.dart';
import 'package:lugat/pages/homeside.dart';
import 'package:lugat/pages/profile.dart';
import 'package:lugat/pages/album.dart';
import 'package:lugat/pages/bookmark.dart';
import 'package:lugat/pages/category.dart';
import 'package:lugat/pages/error.dart';
import 'package:lugat/pages/explore.dart';
import 'package:lugat/pages/homeside.dart';
import 'package:lugat/pages/profile.dart';
import 'package:lugat/pages/term.dart';
import 'package:lugat/pages/test.dart';
import 'package:lugat/utilities/google_sign_in.dart';
import 'categories/game_dev_category.dart';
import 'widgets/texts.dart';
import 'widgets/cards.dart';
import './pages/register.dart';
import './pages/login.dart';
import './pages/error.dart';
import 'package:sizer/sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(ProviderScope(child: Lugat()));

// Home Page

// ignore: camel_case_types
class Lugat extends StatefulWidget {
  const Lugat({Key? key}) : super(key: key);

  @override
  _Lugat_RunState createState() => _Lugat_RunState();
}

// ignore: camel_case_types
class _Lugat_RunState extends State<Lugat> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/register': (context) => const RegisterPage(),
          '/login': (context) => const LoginPage(),
          '/error': (context) => const ErrorPage(),
        },
        theme: MyAppThemes.appThemeLight(),
        home: const SplashScreen(),
      );
    },);
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirebaseInitialized = false;
  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      isFirebaseInitialized = true;
    });
    if (FirebaseAuth.instance.currentUser != null) {
      goHome();
    }
    // goHome();
  }

  void goHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Image.network('https://www.upload.ee/image/13759867/Large_Title.png'),
            ),
            Center(child: isFirebaseInitialized
                ? TextButton(onPressed: () async {
              await signInWithGoogle();
              var uid = FirebaseAuth.instance.currentUser!.uid;
               await FirebaseFirestore.instance.collection('users').doc(uid).set(
                {
                  'isLogged': true,
                  'lastLogInDate': FieldValue.serverTimestamp(),
                },
                SetOptions(merge: true),
              );
              goHome();
            }, child: Container(
              width: 42.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
                    height: 16,
                    width: 16,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Google ile giriş yap',
                    style: TextStyle(
                        color: Colors.black
                    )),
                  ),
                ],
              ),
            ))
                : CircularProgressIndicator())
          ],
        ));
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(
    ),
    ExplorePage(
    ),
    BookmarkPage(
    ),
    ProfilePage(
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Keşfet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Kaydettiklerim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor('#307BF6'),
        unselectedItemColor: HexColor('#B3B3B3'),
        onTap: _onItemTapped,
      ),
    );
  }
}



class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LugatAppBar(),
            SearchBar('Aramak istediğiniz terimi girin'),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 2),
              child: DescriptionText("Öne çıkan kategoriler"),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AiCategory()));
            },
                    child: PopularCategoryCard(
                      "https://www.upload.ee/image/13731286/ai.png",
                      "Yapay Zeka",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MetaverseCategory()),
                      );
                    },
                    child: PopularCategoryCard(
                      "https://www.upload.ee/image/13757839/metaverse.png",
                      "Metaverse",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => GameDevCategory()),
                      );
                    },
                    child: PopularCategoryCard('https://www.upload.ee/image/13787464/gameCreatorCategory.png', 'GameJam'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FrontendCategory()));
                    },
                    child: PopularCategoryCard(
                      "https://www.upload.ee/image/13757844/front-end.png",
                      "Front-end",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BackendCategory()));
                    },
                    child: PopularCategoryCard(
                      "https://www.upload.ee/image/13757847/back-end.png",
                      "Back-end",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UiCategory()));
                    },
                    child: PopularCategoryCard(
                      "https://www.upload.ee/image/13757855/UI__1_.png",
                      "UI",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UxCategory()));
                    },
                    child: PopularCategoryCard(
                      "https://www.upload.ee/image/13757856/UX.png",
                      "UX",
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const MetaverseCategory()),
                );
              },
              child: CategoryCard("Metaverse", "1",
                  "https://www.upload.ee/image/13785661/metaverseCategory.png", "Yalın Metaverse"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 2),
              child: DescriptionText("Kategoriler"),
            ),
            CategoryTitle('Tasarım'),
            CategoryOverview(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SoftwareCategory()),
                );
              },
                child: CategoryTitle("Yazılım")),
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryTermCard(
                        "https://www.upload.ee/image/13757844/front-end.png",
                        "Front-end",
                        "Kerem Alan"),
                    CategoryTermCard(
                        "https://www.upload.ee/image/13757847/back-end.png",
                        "Back-end",
                        "Gökhan Falan"),
                    CategoryTermCard(
                        "https://www.upload.ee/image/13731960/softwareTerm.png",
                        "Git",
                        "Türkmen Köyhan"),
                    CategoryTermCard(
                        "https://www.upload.ee/image/13731960/softwareTerm.png",
                        "Krototip",
                        "Uğur Taylan"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// App Bar

class LugatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LugatAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          "Lügat",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const HomeSide()),
              );
            },
            child: const Icon(Icons.menu),
          ),
        ),
      ],
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

// Themes

class MyAppThemes {
  static ThemeData appThemeLight() {
    return ThemeData(
      scaffoldBackgroundColor: HexColor('#FFFFFF'),
      backgroundColor: HexColor('#FFFFFF'),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('#FFFFF'),
        ),
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.indigo.shade500,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white,
      ),
    );
  }

  static ThemeData appThemeDark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.indigo.shade500,
      ),
    );
  }
}
