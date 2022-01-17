import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lugat/model/term.dart';
import 'package:lugat/pages/category.dart';
import 'package:lugat/pages/term.dart';
import 'texts.dart';
import 'buttons.dart';
import 'package:http/http.dart';

Widget PopularCategoryCard(categoryImgUrl, categoryName) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                "${categoryImgUrl}",
                height: 60,
                width: 60,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Padding(
              padding: EdgeInsets.only(right: 4, left: 4, bottom: 7),
              child: Center(
                child: Caption2TextPopularCategory(
                    "${categoryName}",
                    "#BEBEBE"
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget CategoryCard(categoryName, categoryTermValue, categoryImageUrl, dailyTerm) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      height: 330,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: NetworkImage("${categoryImageUrl}"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Caption2Text("Günün kelimesi", "#FFFFFF"),
                    Caption2Text("$dailyTerm", "#FFFFFF"),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadlineText("${categoryName}", "#FFFFFF"),
                    Caption1Text(
                        "${categoryTermValue} terim içeriyor", "#FFFFFF"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget TermCard(categoryName, termName, termAuthor, termImageUrl) {
  return Padding(
    padding: const EdgeInsets.only(top: 0),
    child: Container(
      height: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        image: DecorationImage(
          image: NetworkImage("${termImageUrl}"),
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.18), BlendMode.darken,
        ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        height: 22,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 1,
                            color: HexColor('#F2F2F2'),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                                "https://www.upload.ee/image/13740444/threedot__1_.png"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadlineText("${termName}", "#FFFFFF"),
                    Caption2Text(
                        "${termAuthor} tarafından oluşturuldu", "#FFFFFF"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget AddTermCard(categoryName, termName, termAuthor, termImageUrl) {
  return Padding(
    padding: const EdgeInsets.only(top: 0),
    child: Container(
      height: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        image: DecorationImage(
          image: NetworkImage("${termImageUrl}"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //Container(
                     // height: 30,
                     // width: 100,
                     // decoration: BoxDecoration(
                      //  borderRadius: BorderRadius.circular(30),
                       // border: Border.all(
                        //  width: 1,
                         // color: HexColor('#F2F2F2'),
                        //),
                      //),
                      //child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                       // children: [
                        //],
                      //),
                    //),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadlineText("${termName}", "#FFFFFF"),
                    Caption2Text(
                        "${termAuthor} tarafından oluşturuldu", "#FFFFFF"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget CategoryTitle(categoryName) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadlineText("${categoryName}", "#000000"),
        SizedBox(
          height: 30,
          child: Caption1Text("Tümünü gör", "#001FC6")),
      ],
    ),
  );
}

Widget CategoryTermCard(termImageUrl, termName, termAuthorName) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 16),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.network(
                  "${termImageUrl}",
                  height: 124,
                  width: 124,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Caption2Text("${termName}", "#000000"),
                    Caption1Text("${termAuthorName}", "#BEBEBE"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget ExploreCategoryCard(categoryName, categoryImageUrl) {
  return Padding(
    padding: const EdgeInsets.only(top: 22.0),
    child: Container(
      height: 144,
      width: 144,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: NetworkImage("${categoryImageUrl}"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadlineText("${categoryName}", "#FFFFFF"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget ExploreTermCard(termName, termAuthor, termImageUrl) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: NetworkImage("${termImageUrl}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FootnoteText('$termName', '#000000'),
            Caption1Text('$termAuthor', '#808080'),
          ],
        ),
      ),
    ],
  );
}

class CategoryOverview extends StatefulWidget {
  CategoryOverview({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryOverviewState createState() => _CategoryOverviewState();
}
class _CategoryOverviewState extends State<CategoryOverview> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms').where("termCategory", isEqualTo: "Design").limit(3).snapshots();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: _termsStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            try{
              if (snapshot.hasError) {
                return const Text('Bir şeyler ters gitmiş olmalı.');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Şu anda içerik yükleniyor.');
              }

              if(snapshot.hasData){
                final items = snapshot.data!.docs.map(
                        (QueryDocumentSnapshot<Object?> data) {
                      final String termTitle = data.get('termTitle');
                      final String termImage = data['termImage'];
                      final String termMean = data['termMean'];
                      final String termExample = data['termExample'];
                      final String termDescription = data['termDescription'];
                      final String termAuthor = data['termAuthor'];
                      final String termCategory = data['termCategory'];
                      final bool isSaved = data['isSaved'];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TermPage(data: data,)));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(data['termImage'],
                              height: 124,
                              width: 124,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(data['termTitle'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                            ),
                            Text(data['termAuthor'],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.4),
                            ),
                            ),
                          ],
                        ),
                      );
                    }
                ).toList();
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 1.4,
                          crossAxisCount: 3,
                        ),
                        itemCount: items.length,
                        padding: const EdgeInsets.only(),
                        itemBuilder: (BuildContext context, int index) {
                          return items[index];
                        }
                    ),
                  ),
                );
              }else{
                return Column(
                  children: [
                    Text("Bir hata meydana geldi!"),
                  ],
                );
              }
            }catch(Exc){
              print(Exc);
              rethrow;
            }
          },
        ),
      ),
    );
  }
}


Widget FilledButton2(buttonWidth, fillColor, captionTextColor, buttonText) {
  return SizedBox(
    width: buttonWidth,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: HexColor("$fillColor"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: Caption1Text("$buttonText", "$captionTextColor"),
    ),
  );
}