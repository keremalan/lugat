import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:lugat/main.dart';
import 'package:lugat/utilities/google_sign_in.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../widgets/buttons.dart';
import '../widgets/texts.dart';
import 'package:sizer/sizer.dart';

String feedbackSubject = '';
String feedbackMessage = '';
String reportCategory = '';
String reportMessage = '';
String reportUpload = '';


class HomeSide extends StatefulWidget {
  const HomeSide({Key? key}) : super(key: key);

  @override
  _HomeSideState createState() => _HomeSideState();
}

class _HomeSideState extends State<HomeSide> {
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
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: HexColor('#D9D9D9'),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LugatAppBarHomeside(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => FeedbackPage()),
                  );
                },
                child: const HomeSideItem(
                    itemTitle: "Geri bildirim",
                    itemDesc: 'Yaşadığınız deneyimi bize ulaştırın.',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => HelpPage()),
                  );
                },
                child: const HomeSideItem(
                    itemTitle: 'Yardım',
                    itemDesc: 'Sıkça sorular sorulara ve iletişim kanalları.',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ReportPage()),
                  );
                },
                child: const HomeSideItem(
                    itemTitle: 'İhlal bildirimi',
                    itemDesc: 'İhlallere acil müdahele bildirim kanalı.',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => RoadMapPage()),
                  );
                },
                child: const HomeSideItem(
                    itemTitle: 'Yol haritası',
                    itemDesc: 'Lügatın geleceğini inceleyin ve söz sahibi olun.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Feedback Page

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String feedbackSubject = '';
  String feedbackMessage = '';
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
                height: 28.6.h,
                decoration: BoxDecoration(
                  color: HexColor("#E5E5E5"),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterAppBar(),
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: HomeSideHead(pageTitle: 'Geri bildirim'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 34, bottom: 12, left: 34),
                child: Column(
                  children: [
                    RegisterBodyHead(headlineText: 'Deneyimlerinizi paylaşın', captionText: 'Hoşunuza giden deneyiminizi, karşılaştığınız hataları ya da eklenmesini istediğiniz özellikleri bize aktarabilirsiniz. Bu sayede deneyimlerinizi zenginleştirmeye devam edeceğiz.'),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Konu boş bırakılamaz';
                              } return null;
                            },
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              labelText: 'Konu',
                              contentPadding: EdgeInsets.only(bottom: 8),
                              labelStyle: TextStyle(
                                color: HexColor("#999999"),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#D9D9D9"),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#000000"),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                feedbackSubject = value;
                              });
                            },
                            onSaved: (value) {
                              var feedbackSubjectMsg = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mesaj boş bırakılamaz';
                              } return null;
                            },
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              labelText: 'Mesaj',
                              contentPadding: EdgeInsets.only(bottom: 8),
                              labelStyle: TextStyle(
                                color: HexColor("#999999"),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#D9D9D9"),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#000000"),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                feedbackMessage = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Center(
                            child: SizedBox(
                              width: 100,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: HexColor("#000000"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  final formState = _formKey.currentState;
                                  if (formState == null) return;
                                  if (formState.validate() == true) {
                                    formState.save();
                                    FirebaseFirestore.instance.collection('feedbacks').add({
                                      'feedbackSubject': feedbackSubject, 'feedbackMessage': feedbackMessage, 'feedbackSender': FirebaseAuth.instance.currentUser!.displayName,
                                    });
                                  }
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const FeedbackSuccessPage()),
                                  );
                                },
                                child: Caption1Text("Gönder", "#FFFFFF"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 380,
                        ),
                      ],
                    ),
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

class FeedbackSuccessPage extends StatefulWidget {
  const FeedbackSuccessPage({Key? key}) : super(key: key);

  @override
  _FeedbackSuccessPageState createState() => _FeedbackSuccessPageState();
}

class _FeedbackSuccessPageState extends State<FeedbackSuccessPage> {
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
                height: 28.6.h,
                decoration: BoxDecoration(
                  color: HexColor("#E5E5E5"),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterAppBar(),
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: HomeSideHead(pageTitle: 'Geri bildirim',),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 34, left: 34),
                child: Column(
                  children: [
                    RegisterBodyHead(headlineText: 'Geri bildiriminiz ekibimize ulaştı!', captionText: 'Topluluğumuzun gelişmesine katkı sağladığın için teşekkür ederiz.'),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 120,
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
                            const Home()),
                      );
                    },
                    child: Caption1Text("Ana sayfa", "#FFFFFF"),
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

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
                height: 28.6.h,
                decoration: BoxDecoration(
                  color: HexColor("#E5E5E5"),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterAppBar(),
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: HomeSideHead(pageTitle: 'Yardım sayfası'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 34, bottom: 12, left: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RegisterBodyHead(headlineText: 'S.S.S', captionText: 'Sıkça sorular sorulara erişmek için dokunun.'),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HeadlineText('İletişim', '#000000'),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: SubheadText('E-Posta', '#505050'),
                      ),
                      BodyText('iletisim@lugat.io', '#909090'),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: SubheadText('Telefon', '#505050'),
                      ),
                      BodyText('0(212) 222-22-22', '#909090'),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: SubheadText('Adres', '#505050'),
                      ),
                      BodyText('Şişli Kolektif House, Nu: 17, Şişli/İstanbul', '#909090'),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Center(
                          child: SizedBox(
                            width: 100,
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
                                      const HomePage()),
                                );
                              },
                              child: Caption1Text("Ana Sayfa", "#FFFFFF"),
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

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _formKey = GlobalKey<FormState>();
  String reportCategory = '';
  String reportMessage = '';
  String reportUpload = '';
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
                height: 28.6.h,
                decoration: BoxDecoration(
                  color: HexColor("#E5E5E5"),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterAppBar(),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: HomeSideHead(pageTitle: 'İhlal bildirimi'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 34, bottom: 12, left: 34),
                child: Column(
                  children: [
                    RegisterBodyHead(headlineText: 'Acil ihlal müdahalesi', captionText: 'Topluluk kurallarını ihlal ettiğini düşündüğünüz içerikleri doğrudan bize bildirebilir, acil müdahale ekibimizin ihlali değerlendirmesini sağlayabilirsiniz.'),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'İhlal türü boş bırakılamaz';
                              } return null;
                            },
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              labelText: 'İhlal Türü',
                              contentPadding: EdgeInsets.only(bottom: 8),
                              labelStyle: TextStyle(
                                color: HexColor("#999999"),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#D9D9D9"),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#000000"),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                reportCategory = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'İhlal açıklaması boş bırakılamaz';
                              } return null;
                            },
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              labelText: 'İhlal açıklaması',
                              contentPadding: EdgeInsets.only(bottom: 8),
                              labelStyle: TextStyle(
                                color: HexColor("#999999"),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#D9D9D9"),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#000000"),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                reportMessage = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'URL boş bırakılamaz';
                              } return null;
                            },
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              labelText: 'Görsel url eklemek için dokunun',
                              contentPadding: EdgeInsets.only(bottom: 8),
                              labelStyle: TextStyle(
                                color: HexColor("#999999"),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#D9D9D9"),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor("#000000"),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                reportUpload = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Center(
                            child: SizedBox(
                              width: 100,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: HexColor("#000000"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  final formState = _formKey.currentState;
                                  if (formState == null) return;
                                  if (formState.validate() == true) {
                                    formState.save();
                                    FirebaseFirestore.instance.collection(
                                        'reports').add({
                                      'reportCategory': reportCategory, 'reportMessage': reportMessage, 'reportUpload': reportUpload, 'reportSender': FirebaseAuth.instance.currentUser!.displayName!,
                                    });
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ReportSuccessPage()),
                                    );
                                  }
                                },
                                child: Caption1Text("Gönder", "#FFFFFF"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 280,
                        ),
                      ],
                    ),
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

class ReportSuccessPage extends StatefulWidget {
  const ReportSuccessPage({Key? key}) : super(key: key);

  @override
  _ReportSuccessPageState createState() => _ReportSuccessPageState();
}

class _ReportSuccessPageState extends State<ReportSuccessPage> {
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
                height: 28.6.h,
                decoration: BoxDecoration(
                  color: HexColor("#E5E5E5"),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterAppBar(),
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: HomeSideHead(pageTitle: 'İhlal bildirimi',),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 34, left: 34),
                child: Column(
                  children: [
                    RegisterBodyHead(headlineText: 'İhlal bildiriminiz müdahale ekibine ulaştı!', captionText: 'Topluluğumuzun değerlerini korumamıza yardımcı olduğun için teşekkür ederiz.'),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 120,
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
                            const Home()),
                      );
                    },
                    child: Caption1Text("Ana sayfa", "#FFFFFF"),
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

class RoadMapPage extends StatefulWidget {
  const RoadMapPage({Key? key}) : super(key: key);

  @override
  _RoadMapPageState createState() => _RoadMapPageState();
}

class _RoadMapPageState extends State<RoadMapPage> {
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
                height: 28.6.h,
                decoration: BoxDecoration(
                  color: HexColor("#E5E5E5"),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterAppBar(),
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: HomeSideHead(pageTitle: 'Yol haritası'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 34, bottom: 12, left: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeadlineText("Lügat'ın Geleceği", '#000000'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Caption2Text("Lügat’ın ortaya çıkışı esnasında belirlediğimiz yol haritası, bize amacımızı hatırlatıyor ve çözüme ulaşma yolunda ne kadar ilerlediğimizi somutlaştırmamızı sağlıyor.", '#8D8D8D'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 12),
                      child: Caption2Text("Lügat’ın Kolektif Topluluğu, bu yol haritasının ayrılmaz bir parçasıdır. Yol haritamızı inceleyerek bu sürece katkı sağlayabilirsiniz. Fikir ve düşüncelerinizi Geri Bildirim sayfasından bize ulaştırmayı unutmatın!", '#8D8D8D'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Caption2Text('Sonraki adım', '#BFBFBF'),
                    ),
                    BodyText('Geri bildirimlerin toplanması', '#000000'),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Caption2Text('1 ay sonra', '#BFBFBF'),
                    ),
                    BodyText("Play Store'da Lügat'ın yayınlanması", '#000000'),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Caption2Text('2 ay sonra', '#BFBFBF'),
                    ),
                    BodyText("Web uygulaması beta yayını", '#000000'),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Caption2Text('2 ay sonra', '#BFBFBF'),
                    ),
                    BodyText("Web uygulamasının yayınlanması", '#000000'),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Caption2Text('3 ay sonra', '#BFBFBF'),
                    ),
                    BodyText("App Gallery yayınına hazırlık", '#000000'),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Caption2Text('3 ay sonra', '#BFBFBF'),
                    ),
                    BodyText("App Gallery'de Lügat'ın yayınlanması", '#000000'),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Caption2Text('4 ay sonra', '#BFBFBF'),
                    ),
                    BodyText("Geri bildirimlerin toplanması", '#000000'),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Caption2Text('4 ay sonra', '#BFBFBF'),
                    ),
                    BodyText("Kolektif ağ araçlarının yayınlanması", '#000000'),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32, bottom: 64),
                        child: Center(
                          child: SizedBox(
                            width: 100,
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
                                      const HomePage()),
                                );
                              },
                              child: Caption1Text("Ana Sayfa", "#FFFFFF"),
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



// Widgets

class HomeSideItem extends StatelessWidget {
  const HomeSideItem({Key? key,
    required this.itemTitle,
    required this.itemDesc,
  }) : super(key: key);
  final String itemTitle;
  final String itemDesc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 9, bottom: 9, left: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText('$itemTitle', '#000000'),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Caption2Text('$itemDesc', '#909090'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class RegisterAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(600);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: HexColor("#E5E5E5"),
      elevation: 0,
      centerTitle: false,
      title: const Padding(
        padding: EdgeInsets.only(left: 0),
        child: Text(
          "Lügat",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}


class RegisterBodyHead extends StatelessWidget {
  const RegisterBodyHead({
    Key? key,
    required this.headlineText,
    required this.captionText,
  }) : super(key: key);

  final String headlineText;
  final String captionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineText("$headlineText", "#000000"),
        Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 27),
          child: Caption1Text("$captionText", "#4D4D4D"),
        ),
      ],
    );
  }
}

class HomeSideHead extends StatelessWidget {
  const HomeSideHead({Key? key,
  required this.pageTitle,
  }) : super(key: key);
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Title1Text('$pageTitle', '#000000'),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: StepProgressIndicator(totalSteps: 1, currentStep: 1, selectedColor: HexColor('#000000'), roundedEdges: Radius.circular(30),),
            ),
          ],
        ),
      ),
    );
  }
}


class RegisterHead extends StatelessWidget {
  const RegisterHead({
    Key? key,
    required this.titleText,
    required this.subheadText,
  }) : super(key: key);

  final String titleText;
  final String subheadText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Title1Text("$titleText", "#000000"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: SubheadText("$subheadText", "#000000"),
        ),
      ],
    );
  }
}

// App Bar


class LugatAppBarHomeside extends StatelessWidget implements PreferredSizeWidget {
  const LugatAppBarHomeside ({Key? key}) : super(key: key);

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
    );
  }
}