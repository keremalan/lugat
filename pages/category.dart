import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:lugat/main.dart';
import 'package:lugat/pages/profile.dart';
import 'package:lugat/pages/term.dart';
import '../widgets/cards.dart';
import '../widgets/texts.dart';

String termCategory = '';
String termTitle = '';
String termMean = '';
String termExample = '';
String termDescription = '';

List <Term> termList = [
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
  Term(termCategory: 'Tasarım', termTitle: 'Prototip', termMean: 'İlk anlami', termExample: 'İlk örnek', termDescription: 'Ek açıklamalar', termImageUrl: 'https://www.upload.ee/image/13711150/griditem__6_.png'),
];

class Term extends StatefulWidget {
  Term({Key? key,
    required this.termCategory,
    required this.termTitle,
    required this.termMean,
    required this.termExample,
    required this.termDescription,
    required this.termImageUrl,
  }) : super(key: key);
    final String termCategory;
    final String termTitle;
    final String termMean;
    final String termExample;
    final String termDescription;
    final String termImageUrl;
  @override
  _TermState createState() => _TermState();
}

class _TermState extends State<Term> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#FFFFFF'),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LugatAppBarCategory(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      CategoryCard("Fotoğrafçılık", "47",
                          "https://www.upload.ee/image/13763005/diyafram.png", "Diyafram"),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeadlineText('Terimler', '#000000'),
                            PopupMenuButton<int>(
                              offset: Offset(-10, 36),
                              elevation: 0,
                              color: HexColor('#000000').withOpacity(0.8),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem<int>(
                                  height: 36,
                                  value: 0,
                                  child: Row(
                                    children: [
                                      Text("En popüler",
                                          style: TextStyle(
                                              color: HexColor('#FFFFFF'))),
                                    ],
                                  ),
                                ),
                                PopupMenuDivider(height: 4),
                                PopupMenuItem<int>(
                                  height: 36,
                                  value: 1,
                                    child: Text("En yeni",
                                        style: TextStyle(
                                            color: HexColor('#FFFFFF')))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TermPage()),
                              );
                            },
                            child: TermOverviewCard(
                                termImageUrl:
                                "https://www.upload.ee/image/13763015/diyafram__1_.png",
                                termName: 'Diyafram',
                                termDescription:
                                'Lensin aldığı ışık miktarı'),
                          ),
                          TermOverviewCard(
                              termImageUrl:
                              "https://www.upload.ee/image/13731924/prototypeTerm.png",
                              termName: 'Prototip',
                              termDescription:
                              'Ürün geliştirme sürecinde, ürünün kı...'),
                          TermOverviewCard(
                              termImageUrl:
                              "https://www.upload.ee/image/13731924/prototypeTerm.png",
                              termName: 'Prototip',
                              termDescription:
                              'Ürün geliştirme sürecinde, ürünün kı...'),
                          TermOverviewCard(
                              termImageUrl:
                              "https://www.upload.ee/image/13731924/prototypeTerm.png",
                              termName: 'Prototip',
                              termDescription:
                              'Ürün geliştirme sürecinde, ürünün kı...'),
                        ].joinWidgetList(
                              (index) => Divider(),
                      ),
                      ),
                    ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTermPage extends StatefulWidget {
  const AddTermPage({Key? key}) : super(key: key);

  @override
  _AddTermPageState createState() => _AddTermPageState();
}

class _AddTermPageState extends State<AddTermPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final Map<String, dynamic> entry = {};
  String termTitle = '';
  String termMeans = '';
  String termExample = '';
  String termDescription = '';
  String termAuthor = '';
  String _myActivity = '';
  String termCategory = '';
  String _myActivityResult = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var formKey;
    var form = formKey.currentState;
    if(form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#FFFFFF'),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                LugatAppBarAddTerm(),
                Container(
                  child: Column(
                    children: [
                      AddTermCard('Tasarım', 'Terim adı', 'Kerem Alan', 'https://www.upload.ee/image/13741477/Rectangle_39.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, right: 16, left: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Title2Text('Terim adı', '#000000'),
                            Text('${FirebaseAuth.instance.currentUser!.displayName!}'),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Terim adı boş bırakılamaz';
                                  } return null;
                                },
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: TextStyle(
                                  color: HexColor('#999999'),
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Bilgi eklemek için buraya dokun",
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    termTitle = value;
                                  });
                                },
                                onSaved: (newValue) {
                                  entry['titleName'] = newValue;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: BodyText('Akla gelen ilk anlamı', '#000000'),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Akla gelen ilk anlamı boş bırakılmaması';
                              } return null;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(
                              color: HexColor('#999999'),
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Bilgi eklemek için buraya dokun",
                            ),
                            onChanged: (value) {
                            setState(() {
                              termMeans = value;
                            });
                          },
                            onSaved: (newValue) {
                              entry['titleMean'] = newValue;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: BodyText('Örnek', '#000000'),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Örnek boş bırakılmamalı';
                              } return null;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(
                              color: HexColor('#999999'),
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Bilgi eklemek için buraya dokun",
                            ),
                            onChanged: (value) {
                              setState(() {
                                termExample = value;
                              });
                            },
                            onSaved: (newValue) {
                              entry['titleExample'] = newValue;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: BodyText('Ek açıklamalar', '#000000'),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ek açıklamalar boş bırakılmaması';
                              } return null;
                            },
                            controller: controller,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(
                              color: HexColor('#999999'),
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Bilgi eklemek için buraya dokun",
                            ),
                            onChanged: (value) {
                              setState(() {
                                termDescription = value;
                              });
                            },
                            onSaved: (newValue) {
                              entry['titleDescription'] = newValue;
                              entry['termAuthor'] = FirebaseAuth.instance.currentUser!.displayName!;
                              entry['isSaved'] = false;
                            },
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 37),
                              child: ElevatedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: HexColor("#007AFF"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  final formState = _formKey.currentState;
                                  if (formState == null) return;
                                  if (formState.validate() == true) {
                                    formState.save();
                                    print(entry);
                                    FirebaseFirestore.instance.collection('terms').add({
                                      'termTitle': termTitle, 'termCategory': termCategory, 'termMean': termMeans, 'termExample': termExample, 'termDescription': termDescription, 'termAuthor': '${FirebaseAuth.instance.currentUser!.displayName!}', 'isSaved': false,
                                    });


                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const Home()),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: BodyText("Tamamla", "#FFFFFF"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

class AddTermSuccessPage extends StatefulWidget {
  const AddTermSuccessPage({Key? key}) : super(key: key);

  @override
  _AddTermSuccessPageState createState() => _AddTermSuccessPageState();
}

class _AddTermSuccessPageState extends State<AddTermSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#FFFFFF'),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LugatAppBarAddTerm(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 36, bottom: 4),
                      child: Title2Text('Teriminiz başarıyla oluşturuldu.', '#000000'),
                    ),
                    Caption2Text("Aşağıdaki butona tıklayarak kategoriye dönebilirsiniz.", '#909090'),
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Center(
                        child: SizedBox(
                          width: 200,
                          height: 40,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: HexColor("#000000"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const CategoryPage()),
                              );
                            },
                            child: BodyText("Tasarım Kategorisi", "#FFFFFF"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LugatAppBarCategory extends StatelessWidget
    implements PreferredSizeWidget {
  LugatAppBarCategory({Key? key}) : super(key: key);

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
          "Fotoğrafçılık",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AddTermPage()),
                );
              },
              child: Icon(Icons.add)),
        ),
      ],
    );
  }
}

class LugatAppBarAddTerm extends StatelessWidget
    implements PreferredSizeWidget {
  LugatAppBarAddTerm({Key? key}) : super(key: key);

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
          "Terim ekle",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// class Term {
//   String termCategory;
//   String termTitle;
//   String termMean;
//   String termExample;
//   String termDescription;
//   String termImageUrl;
//
//   Term(this.termCategory, this.termTitle, this.termMean, this.termExample, this.termDescription, this.termImageUrl);
// }
