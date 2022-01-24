import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:lugat/main.dart';
import 'package:lugat/pages/profile.dart';
import 'package:lugat/pages/term.dart';
import '../widgets/cards.dart';
import 'package:lugat/pages/error.dart';
import 'package:lugat/pages/homeside.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../widgets/buttons.dart';
import '../widgets/texts.dart';
import 'package:sizer/sizer.dart';
import '../repository/term_repository.dart';

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

class OthersCategory extends StatefulWidget {
  const OthersCategory({Key? key}) : super(key: key);

  @override
  _OthersCategoryState createState() => _OthersCategoryState();
}

class _OthersCategoryState extends State<OthersCategory> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms').where('termCategory', isEqualTo: 'Others').snapshots();
  final Stream<QuerySnapshot> _termStream = FirebaseFirestore.instance
      .collection('terms').where('termCategory', isEqualTo: 'Others').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddTermPage(),
          ));
        },
        backgroundColor: HexColor('#000000'),
        child: Icon(Icons.add),
      ),
      body: Material(
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
                        CategoryCard("Diğer terimler", "1",
                            "https://www.upload.ee/image/13821620/others__2_.png", "Gülümse"),
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
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: _termsStream,
                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                                if (snapshot.hasError) {
                                  return Text('Bir şeyler ters gitmiş olmalı.');
                                }

                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Text('Şu anda içerik yükleniyor.');
                                }

                                return MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: ListView(
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children: snapshot.data!.docs.map((QueryDocumentSnapshot<Object?> data) {
                                      final String termTitle = data.get('termTitle');
                                      final String termImage = data['termImage'];
                                      final String termMean = data['termMean'];
                                      final String termExample = data['termExample'];
                                      final String termDescription = data['termDescription'];
                                      final String termAuthor = data['termAuthor'];
                                      final String termCategory = data['termCategory'];
                                      final bool isSaved = data['isSaved'];
                                      final String termContributor = data['termContributor'];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => TermPage(data: data,)));
                                        },
                                        child: ListTile(
                                          contentPadding:EdgeInsets.all(0),
                                          leading: ClipOval(
                                            child: Image.network(data['termImage'],
                                              height: 50,
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: Text(data['termTitle'],
                                            style: TextStyle(
                                                fontSize: 16
                                            ),
                                          ),
                                          subtitle: Text(data['termExample'],
                                            style: TextStyle(
                                              fontSize: 13,
                                              overflow: TextOverflow.ellipsis,
                                            ),),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                );
                              },
                            ),
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
  String uid = '';
  String termImage = '';
  String termContributor = '';

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
                      AddTermCard('Tasarım', 'Terim adı', '${FirebaseAuth.instance.currentUser!.displayName!}', 'https://www.upload.ee/image/13741477/Rectangle_39.png'),
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
                            child: BodyText('Görseli', '#000000'),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Terimin görseli bırakılmamalıdır';
                              } return null;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(
                              color: HexColor('#999999'),
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Url eklemek için buraya dokun",
                            ),
                            onChanged: (value) {
                              setState(() {
                                termImage = value;
                                termCategory = 'Ai';
                                termContributor = FirebaseAuth.instance.currentUser!.displayName!;
                              });
                            },
                            onSaved: (newValue) {
                              entry['termImage'] = newValue;
                            },
                          ),
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
                                termCategory = 'Others';
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
                              uid = '${FirebaseAuth.instance.currentUser!.uid}';
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
                                      'termTitle': termTitle, 'termImage': termImage, 'termCategory': termCategory, 'termMean': termMeans, 'termExample': termExample, 'termDescription': termDescription, 'termAuthor': '${FirebaseAuth.instance.currentUser!.displayName!}', 'isSaved': false, 'uid': uid, 'termContributor': termContributor,
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
                          SizedBox(
                            height: 380,
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
                                    const OthersCategory()),
                              );
                            },
                            child: BodyText("Diğerleri Kategorisi", "#FFFFFF"),
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
          "Diğer Terimler",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
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
