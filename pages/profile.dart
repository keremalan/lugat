import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:lugat/main.dart';
import 'package:lugat/pages/homeside.dart';
import 'package:lugat/pages/term.dart';
import 'package:lugat/utilities/google_sign_in.dart';
import '../widgets/texts.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Stream<QuerySnapshot> _termsStream = FirebaseFirestore.instance
      .collection('terms').where('uid', isEqualTo: '${FirebaseAuth.instance.currentUser!.uid}').snapshots();
  final Stream<QuerySnapshot> _designTermsStream = FirebaseFirestore.instance
      .collection('terms').where('uid', isEqualTo: '${FirebaseAuth.instance.currentUser!.uid}').where('termCategory', isEqualTo: 'Design').snapshots();
  final Stream<QuerySnapshot> _softwareTermsStream = FirebaseFirestore.instance
      .collection('terms').where('uid', isEqualTo: '${FirebaseAuth.instance.currentUser!.uid}').where('termCategory', isEqualTo: 'Software').snapshots();
  final Stream<QuerySnapshot> _metaverseTermsStream = FirebaseFirestore.instance
      .collection('terms').where('uid', isEqualTo: '${FirebaseAuth.instance.currentUser!.uid}').where('termCategory', isEqualTo: 'Metaverse').snapshots();
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
              LugatAppBarProfile(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: ProfileHead(userName: '${FirebaseAuth.instance.currentUser!.displayName!}', userTitle: '', userCompany: '', userNotificationValue: '',),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HeadlineText('Katkılarım', '#000000'),
                            Caption2Text('Tümünü gör', '#001FC6'),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TextButton(child: ProfileOverviewCard(overviewCategoryColor: '#007AFF', overviewCategoryName: 'Tasarım', overviewCategoryValue: '',),
                              onPressed: () {
                              showModalBottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,context: context, builder: (BuildContext context){
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 36, top: 22),
                                        child: Row(
                                          children: [
                                            BodyText("Tasarım kategorisine katkılarım", '#000000'),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 26, top: 16),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: StreamBuilder<QuerySnapshot>(
                                                stream: _designTermsStream,
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
                                                              ),),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                              },
                            ),
                            TextButton(child: ProfileOverviewCard(overviewCategoryColor: '#34C85A', overviewCategoryName: 'Yazılım', overviewCategoryValue: '',),
                              onPressed: () {
                                showModalBottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,context: context, builder: (BuildContext context){
                                  return SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 36, top: 22),
                                          child: Row(
                                            children: [
                                              BodyText("Yazılım kategorisine katkılarım", '#000000'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 26, top: 16),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: StreamBuilder<QuerySnapshot>(
                                                  stream: _softwareTermsStream,
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
                                                                ),),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                            ),
                            TextButton(child: ProfileOverviewCard(overviewCategoryColor: '#FFCC00', overviewCategoryName: 'Metaverse', overviewCategoryValue: '',),
                              onPressed: () {
                                showModalBottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,context: context, builder: (BuildContext context){
                                  return SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 36, top: 22),
                                          child: Row(
                                            children: [
                                              BodyText("Metaverse kategorisine katkılarım", '#000000'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 26, top: 16),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: StreamBuilder<QuerySnapshot>(
                                                  stream: _metaverseTermsStream,
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
                                                                ),),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      ProfileOverviewSubText(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Align(
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

class TermOverviewCard extends StatefulWidget {
  TermOverviewCard({
    Key? key,
    required this.termImageUrl,
    required this.termName,
    required this.termDescription,
  }) : super(key: key);
  String termImageUrl;
  String termName;
  String termDescription;

  @override
  State<TermOverviewCard> createState() => _TermOverviewCardState();
}

class _TermOverviewCardState extends State<TermOverviewCard> {
  bool isVisible = false;
  @override

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          "${widget.termImageUrl}",
                          height: 40,
                          width: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubheadText('${widget.termName}', '#000000'),
                            Caption2Text('${widget.termDescription}', '#808080'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12.w,
                    child: TextButton(onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    }, child: Icon(Icons.expand_more, color: HexColor('#9D9D9D'), size: 24)),
                  ),
                ],
              ),
              Visibility(
                visible: isVisible,
                child: SizedBox(
                  width:85.w,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0, left: 30),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 1,
                        alignment: WrapAlignment.center,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: HexColor("#FFFFFF"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const Home()),
                              );
                            },
                            child: Caption1Text("Katkı sağla", "#000000"),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: HexColor("#FFFFFF"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const ReportPage()),
                              );
                            },
                            child: Caption1Text("Bildir", "#000000"),
                          ),
                        ],
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileOverviewSubText extends StatelessWidget {
  const ProfileOverviewSubText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 28),
          child: DescriptionText('Son katkılarım'),
        ),
        //Padding(
          //padding: const EdgeInsets.only(top: 12.0),
          //child: Container(
            //height: 30,
            //width: 40,
            //decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(30),
              //border: Border.all(
                //width: 1,
                //color: HexColor('#F2F2F2'),
              //),
            //),
            //child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              //children: [
               // Image.network("https://www.upload.ee/thumb/13739155/threedot.png"),
              //],
            //),
          //),
        //),
      ],
    );
  }
}

class ProfileOverviewCard extends StatelessWidget {
  ProfileOverviewCard({
    Key? key,
    required this.overviewCategoryColor,
    required this.overviewCategoryName,
    required this.overviewCategoryValue,
  }) : super(key: key);
  String overviewCategoryColor;
  String overviewCategoryName;
  String overviewCategoryValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 8.h,
        width: 31.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 1,
              color: HexColor('#F2F2F2'),
            )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: HexColor('$overviewCategoryColor'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyText('$overviewCategoryName', '#000000'),
                  Caption1Text('$overviewCategoryValue', '#808080'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileHead extends StatelessWidget {
  ProfileHead({
    Key? key,
    required this.userName,
    required this.userTitle,
    required this.userCompany,
    required this.userNotificationValue,
  }) : super(key: key);
  String userName;
  String userTitle;
  String userCompany;
  String userNotificationValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Title2Text('$userName', '#000000'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Caption2Text(
                      '$userTitle', '#A7A7A7'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Caption2Text('', '#A7A7A7'),
                ),
                Caption2Text('$userCompany', '#A7A7A7'),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                "${FirebaseAuth.instance.currentUser!.photoURL!}",
                height: 50,
                width: 50,
              ),
            ),
            //Positioned(
              //child: Container(
                //height: 24,
                //width: 24,
                //decoration: BoxDecoration(
                 // borderRadius: BorderRadius.circular(30),
                  //color: Colors.red,
                //),
                //child: Center(
                  //child: GestureDetector(
                    //onTap: () {
                      //Navigator.push(context, MaterialPageRoute(
                        //  builder: (context) => const NotificationPage()),
                      //);
                    //},
                    //child: Text("${userNotificationValue}",
                        //style: TextStyle(
                          //  color: Colors.white,
                            //fontWeight: FontWeight.w700)),
                  //),
                //),
             // ),
              //top: 26,
            //),
          ],
        ),
      ],
    );
  }
}

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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
              LugatAppBarProfileSettings(),
              Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const ProfileSettingsPersonal()),
                            );
                          },
                            child: HomeSideItem(itemTitle: 'Kişisel bilgiler', itemDesc: 'Kullanıcı adınız, profil özetiniz'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const ProfileSettingsSecurity()),
                            );
                          },
                            child: HomeSideItem(itemTitle: 'Güvenlik', itemDesc: 'Şifreniz ve şifre kurtarma araçlarınız'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const ProfileSettingsBlockContent()),
                            );
                          },
                            child: HomeSideItem(itemTitle: 'Engelli içerikler', itemDesc: 'Görmek istemediğinizi belirttiğiniz terimler ve kanallar'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const ProfileSettingsHelp()),
                            );
                          },
                            child: HomeSideItem(itemTitle: 'Yardım', itemDesc: 'Sıkça sorulan sorulara ve iletişim kanallarına göz atın'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 84),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: TextButton(
                              onPressed: () async {
                                await signOutWithGoogle();
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SplashScreen()),
                                );
                              },
                              child: Text("Çıkış yap"),
                            ),
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
      ),
    );
  }
}

class ProfileSettingsPersonal extends StatefulWidget {
  const ProfileSettingsPersonal({Key? key}) : super(key: key);

  @override
  _ProfileSettingsPersonalState createState() => _ProfileSettingsPersonalState();
}

class _ProfileSettingsPersonalState extends State<ProfileSettingsPersonal> {
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
              LugatAppBarProfileSettings(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: HeadlineText('Kişisel bilgiler', '#000000'),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ProfileSettingsPersonalItem(itemText: 'Profil Fotoğrafı', itemDescription: 'Düzenlemek için dokunun',),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ProfileSettingsPersonalItem(itemText: 'İsim', itemDescription: '${FirebaseAuth.instance.currentUser!.displayName!}',),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ProfileSettingsPersonalItem(itemText: 'İlgi alanı / İş', itemDescription: 'Arayüz Tasarımı',),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ProfileSettingsPersonalItem(itemText: 'Kurum', itemDescription: 'Geight',),
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

class ProfileSettingsPersonalItem extends StatelessWidget {
  ProfileSettingsPersonalItem({
    required this.itemText,
    required this.itemDescription,
    Key? key,
  }) : super(key: key);
  String itemText;
  String itemDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyText('$itemText', '#000000'),
            Caption1Text('$itemDescription', '#9D9D9D'),
          ],
        ),
        Icon(
            Icons.edit,
          color: HexColor('#007AFF'),
        ),
      ],
    );
  }
}

final userEmail = 'kerem.alan@outlook.com';
final userPhone = '+90(534) 743 77-51';

class ProfileSettingsSecurity extends StatefulWidget {
  const ProfileSettingsSecurity({Key? key}) : super(key: key);

  @override
  _ProfileSettingsSecurityState createState() => _ProfileSettingsSecurityState();
}

class _ProfileSettingsSecurityState extends State<ProfileSettingsSecurity> {
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
              LugatAppBarProfileSettings(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: HeadlineText('Güvenlik', '#000000'),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ProfileSettingsPersonalItem(itemText: 'E-Posta adresi', itemDescription: '${FirebaseAuth.instance.currentUser!.email!}',),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ProfileSettingsPersonalItem(itemText: 'Şifre', itemDescription: '********',),
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

class ProfileSettingsBlockContent extends StatefulWidget {
  const ProfileSettingsBlockContent({Key? key}) : super(key: key);

  @override
  _ProfileSettingsBlockContentState createState() => _ProfileSettingsBlockContentState();
}

class _ProfileSettingsBlockContentState extends State<ProfileSettingsBlockContent> {
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
              LugatAppBarProfileSettings(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: HeadlineText('Engelli içerikler', '#000000'),
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Column(
                            children: [
                              TermOverviewCard(termImageUrl: "https://www.upload.ee/image/13740314/blockPrototype.png", termName: 'Gizlenen terim adı', termDescription: 'Gizlenen terim açıklaması'),
                              Divider(),
                              TermOverviewCard(termImageUrl: "https://www.upload.ee/image/13740314/blockPrototype.png", termName: 'Gizlenen terim adı', termDescription: 'Gizlenen terim açıklaması'),
                              Divider(),
                              TermOverviewCard(termImageUrl: "https://www.upload.ee/image/13740314/blockPrototype.png", termName: 'Gizlenen terim adı', termDescription: 'Gizlenen terim açıklaması'),
                              Divider(),
                              TermOverviewCard(termImageUrl: "https://www.upload.ee/image/13740314/blockPrototype.png", termName: 'Gizlenen terim adı', termDescription: 'Gizlenen terim açıklaması'),
                            ],
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
    );
  }
}

class ProfileSettingsHelp extends StatefulWidget {
  const ProfileSettingsHelp({Key? key}) : super(key: key);

  @override
  _ProfileSettingsHelpState createState() => _ProfileSettingsHelpState();
}

class _ProfileSettingsHelpState extends State<ProfileSettingsHelp> {
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
              LugatAppBarProfileSettings(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: HeadlineText('Yardım', '#000000'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BodyText('Sıkça Sorulan Sorular', '#4D4D4D'),
                              Caption2Text('Sık sorulan sorulara erişmek için dokunun', '#9F9F9F'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 12),
                            child: HeadlineText('İletişim', '#000000'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BodyText('E-Posta', '#4D4D4D'),
                              Caption2Text("iletisim@lugat.io", "#9F9F9F"),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyText('Telefon', '#4D4D4D'),
                                Caption2Text("+90 (534) 743 77-51", "#9F9F9F"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyText('Adres', '#4D4D4D'),
                                Caption2Text("Şişli Kolektif House, Nu: 17, Şişli/İstanbul", "#9F9F9F"),
                              ],
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

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
                LugatAppBarNotification(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Title2Text('Bildirimlerim', '#000000'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: DescriptionText('Görüntülenmemiş bildirimler'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TermOverviewCard(termImageUrl: "https://www.upload.ee/image/13731924/prototypeTerm.png", termName: "Prototip", termDescription: "24 yeni beğeni."),
                    Divider(color: HexColor('#F8F8F8')),
                    TermOverviewCard(termImageUrl: "https://www.upload.ee/image/13731924/prototypeTerm.png", termName: "Prototip", termDescription: "Moderatör tarafından onaylandı."),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 8),
                      child: DescriptionText('Önceki bildirimler'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TermOverviewCard(termImageUrl: 'https://www.upload.ee/image/13741255/circuitTerm.png', termName: 'Circuit', termDescription: 'Kart tasarımı için kullanılan mantıksa...')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LugatAppBarNotification extends StatelessWidget
    implements PreferredSizeWidget {
  LugatAppBarNotification({Key? key}) : super(key: key);

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
          "",
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

class LugatAppBarProfile extends StatelessWidget
    implements PreferredSizeWidget {
  LugatAppBarProfile({Key? key,}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        title: Text(
          "Profil",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileSettings()),
                );
              },
              child: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}

class LugatAppBarProfileSettings extends StatelessWidget
    implements PreferredSizeWidget {
  LugatAppBarProfileSettings({Key? key}) : super(key: key);

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
          "Profil Ayarlarım",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
