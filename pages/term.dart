import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:lugat/main.dart';
import 'package:lugat/pages/category.dart';
import 'package:lugat/pages/profile.dart';
import '../widgets/cards.dart';
import 'package:lugat/pages/error.dart';
import 'package:lugat/pages/homeside.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../widgets/buttons.dart';
import '../widgets/texts.dart';
import 'package:sizer/sizer.dart';

class TermPage extends StatefulWidget {
  const TermPage({this.data});
  final QueryDocumentSnapshot<Object?>? data;

  @override
  _TermPageState createState() => _TermPageState();
}

class _TermPageState extends State<TermPage> {
  bool isEditable = true;
  String editButtonText = "Katkı sağla";
  String editingButtonText = "Tamamla";
  bool isVisible = true;
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  String termTitle = "Adını düzenleyin";
  String termExample = "Örneği düzenleyin";
  String termMean = "Akla gelen ilk anlamını düzenleyin";
  String termDescription = "Ek açıklamaları düzenleyin";
  String termImage = "Görseli düzenleyin";
  String termContributor = "";
  final _formKey = GlobalKey<FormState>();

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
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      AppBar(),
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: TermCard('Fotoğrafçılık', widget.data!.get('termTitle'), widget.data!.get('termAuthor'),
                            widget.data!.get('termImage'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: isEditable == false,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Katkı Sağlıyorsunuz!", style: TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.w600),),
                                    SizedBox(height: 4),
                                    Text("Yalnızca katkı sağlamak istediğiniz alanları doldurup, geri kalan alanları boş bırakabilirsiniz."),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 22, bottom: 22),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HeadlineText(widget.data!.get('termTitle'), '#000000'),
                                  Row(
                                    children: [
                                      Visibility(
                                        visible: isEditable,
                                        child: SizedBox(
                                          height: 20,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size(50, 30),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                isEditable = !isEditable;
                                              });
                                            },
                                            child: isEditable
                                                ? Caption2Text(
                                                    '$editButtonText',
                                                    '#001FC6')
                                                : Caption2Text(
                                                    '$editingButtonText',
                                                    '#001FC6'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: BodyText(
                                          'Terim adı', '#000000'),
                                    ),
                                    Visibility(
                                        visible: isEditable,
                                        child:
                                            BodyText(widget.data!.get('termTitle'), '#999999')),
                                    Visibility(
                                      visible: isEditable == false,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                termTitle = value;
                                              });
                                            },
                                            maxLength: 16,
                                            controller: _controller,
                                            decoration: InputDecoration(
                                              hintText: 'Adını düzenleyin',
                                              suffixIcon: TextButton(
                                                  onPressed: () {
                                                    _formKey.currentState!
                                                        .validate();
                                                  },
                                                  child: Icon(Icons.check)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                        visible: isEditable == false,
                                        child:
                                        BodyText('Terimin görseli', '#999999')),
                                    Visibility(
                                      visible: isEditable == false,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                termImage = value;
                                              });
                                            },
                                            controller: _controller5,
                                            decoration: InputDecoration(
                                              hintText: 'Görselin URL adresini düzenleyin',
                                              suffixIcon: TextButton(
                                                  onPressed: () {
                                                    _formKey.currentState!
                                                        .validate();
                                                  },
                                                  child: Icon(Icons.check)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 22, bottom: 4),
                                      child: BodyText('Akla gelen ilk anlamı', '#000000'),
                                    ),
                                    Visibility(
                                        visible: isEditable,
                                        child:
                                        BodyText(widget.data!.get('termMean'), '#999999')),
                                    Visibility(
                                      visible: isEditable == false,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                termMean = value;
                                              });
                                            },
                                            controller: _controller2,
                                            decoration: InputDecoration(
                                              hintText: 'Akla gelen ilk anlamını düzenleyin',
                                              suffixIcon: TextButton(
                                                  onPressed: () {
                                                    _formKey.currentState!
                                                        .validate();
                                                  },
                                                  child: Icon(Icons.check)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 22, bottom: 4),
                                      child: BodyText('Örnek', '#000000'),
                                    ),
                                    Visibility(
                                        visible: isEditable,
                                        child:
                                        BodyText(widget.data!.get('termExample'), '#999999')),
                                    Visibility(
                                      visible: isEditable == false,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                termExample = value;
                                              });
                                            },
                                            controller: _controller3,
                                            decoration: InputDecoration(
                                              hintText: 'Örneği düzenleyin',
                                              suffixIcon: TextButton(
                                                  onPressed: () {
                                                    _formKey.currentState!
                                                        .validate();
                                                  },
                                                  child: Icon(Icons.check)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 22, bottom: 4),
                                      child: BodyText('Ek açıklamalar', '#000000'),
                                    ),
                                    Visibility(
                                        visible: isEditable,
                                        child:
                                        BodyText(widget.data!.get('termDescription'), '#999999')),
                                    Visibility(
                                      visible: isEditable == false,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                termDescription = value;
                                              });
                                            },
                                            controller: _controller4,
                                            decoration: InputDecoration(
                                              hintText: 'Ek açıklamaları düzenleyin',
                                              suffixIcon: TextButton(
                                                  onPressed: () {
                                                    _formKey.currentState!
                                                        .validate();
                                                  },
                                                  child: Icon(Icons.check)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 24),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 22, bottom: 0),
                                            child: Visibility(
                                              visible: isEditable == false,
                                              child: Center(
                                                child: TextButton(
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(30),
                                                          )),
                                                      backgroundColor:
                                                      MaterialStateProperty.all(
                                                          HexColor('#007AFF')),
                                                    ),
                                                    onPressed: () {
                                                      final formState = _formKey.currentState;
                                                      if (formState == null) return;
                                                      if (formState.validate() == true) {
                                                        formState.save();
                                                        FirebaseFirestore.instance.collection('contributes').add({
                                                          'termTitle': termTitle, 'termMean': termMean, 'termExample': termExample, 'termDescription': termDescription, 'termImage': termImage, 'termAuthor': FirebaseAuth.instance.currentUser!.displayName!, 'termContributor': termContributor,
                                                        });
                                                      }
                                                      setState(() {
                                                        isEditable = !isEditable;
                                                        termTitle = _controller.text;
                                                      });
                                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContributeSuccess()));
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 6,
                                                          right: 8,
                                                          bottom: 6,
                                                          left: 8),
                                                      child: Text('Tamamla',
                                                          style: TextStyle(
                                                              color: HexColor(
                                                                  '#FFFFFF'))),
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: isEditable == false,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 24, top: 20),
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isEditable = !isEditable;
                                                  });
                                                },
                                                child: Text("İptal et"),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      BodyText('Katkı sağlayanlar', '#000000'),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 20),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                //child: Image.network(
                                                    //'',
                                                    //height: 20,
                                                    //width: 20),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0, bottom: 0),
                                                child: Caption2Text(
                                                    '${widget.data!.get('termContributor')}',
                                                    '#BFBFBF'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: isEditable == false,
                              child: SizedBox(height: 250),
                            ),
                          ],
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

class ContributeSuccess extends StatelessWidget {
  const ContributeSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LugatAppBarTerm(),
          Image.network("https://www.upload.ee/image/13812439/done.png",
          height: 48,
          width: 48,),
          SizedBox(height: 16),
          Container(
            child: Column(
              children: [
                Text("Düzenlemeleriniz başarıyla kaydedildi.", style: TextStyle(color: HexColor('#0A621D'), fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Moderatörlerin incelemesinden sonra gerekli değişiklikler yapılacaktır.", textAlign: TextAlign.center, style: TextStyle(color: HexColor('#063E13'), fontSize: 12)),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context)=> Home()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: HexColor('#063E13'),
                borderRadius: BorderRadius.circular(30),
              ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                  child: Text("Anasayfa'ya dönmek için tıklayın", style: TextStyle(color: HexColor('#FFFFFF')),),
                )),
          ),
        ],
      ),
    );
  }
}


class LugatAppBarTerm extends StatelessWidget implements PreferredSizeWidget {
  LugatAppBarTerm({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }
}
