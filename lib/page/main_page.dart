import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:profile_1/page/profile_page.dart';
import 'package:profile_1/widget/textfield_widget.dart';
import 'package:profile_1/login-register/LoginScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> imageList = [
    "https://media.istockphoto.com/photos/happy-students-walking-together-in-campus-having-break-picture-id1165683016?k=20&m=1165683016&s=612x612&w=0&h=Rzay--91ScZFiD-eJL6o6jA3v3AUBokbaOEjxgPGzSQ=",
    "https://media.istockphoto.com/photos/happy-black-student-raising-arm-to-answer-question-while-attending-picture-id1307457391?k=20&m=1307457391&s=612x612&w=0&h=Rj2wqBSqQ6iwwIPwRrdtpO7RAjkS4JrWtA7QjvZUgyc=",
    "https://media.istockphoto.com/photos/business-people-working-picture-id1169096513?k=20&m=1169096513&s=612x612&w=0&h=mnUKKSMIajgo9y8W4aisHIhAvdzByLzqUW5vsmZBl7E=",
    "https://media.istockphoto.com/photos/graduation-day-picture-id1066324992?k=20&m=1066324992&s=612x612&w=0&h=IThBZfVQnjL1mCR5fivmqigAhCPL_RkRzGuaSisNXrc=",
  ];

  Widget _BScard(int value) {
    String url = "";
    if (value == 1) {
      url =
          "https://media.istockphoto.com/photos/university-application-form-picture-id168367619?k=20&m=168367619&s=612x612&w=0&h=TLPr2sgJ-3d1R6xH8QJ9DtGt1FoXE5xduX0xGf_9WPw=";
    } else if (value == 2) {
      url =
          "https://media.istockphoto.com/photos/group-of-diverse-multiethnic-people-with-various-jobs-picture-id513957135?k=20&m=513957135&s=612x612&w=0&h=Pb5ooTjGpFUwW6rz3bM_asypplABHCQJ_6QhqB5dakw=";
    } else if (value == 3) {
      url =
          "https://media.istockphoto.com/photos/delivering-an-informative-presentation-like-a-pro-picture-id1141464027?k=20&m=1141464027&s=612x612&w=0&h=gyoKUv7vRVS6MWUjBCLWOu9Gu2WpQmk9W868HyEHvVA=";
    } else if (value == 4) {
      url =
          "https://media.istockphoto.com/photos/group-of-volunteers-with-surgical-masks-cleaning-nature-together-picture-id1265552575?k=20&m=1265552575&s=612x612&w=0&h=qopAHOutHxR50odcGoWOQqfkAmYuyCZTYndDojcHWn8=";
    }
    return Card(
      child: Image.network(
        url,
        fit: BoxFit.cover,
        width: 140.0,
        height: 150.0,
      ),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
    );
  }

  Widget _BSDetaisl(String Degree, String prof, int value) {
    String Desp = "";
    if (value == 1) {
      Desp =
          "Nh???m cung c???p ?????y ????? th??ng tin v??? ng??nh ngh???, t???o ??i???u ki???n cho th?? sinh c?? nhi???u c?? h???i x??t tuy???n v??o ?????i h???c.";
    } else if (value == 2) {
      Desp =
          "N??m nay ???? l?? n??m th??? 6 tr?????ng ?????i h???c ????ng ?? k???t h???p c??ng c??ng ty SEKISHO VI???T NAM t??? ch???c Ng??y h???i vi???c l??m v???i t??n g???i ???SEKISHO JOB FAIR???";
    } else if (value == 3) {
      Desp =
          "Theo ?????nh h?????ng ???ng d???ng v?? ngh??? nghi???p, h???i nh???p qu???c t???. Ch????ng tr??nh ????o t???o l???y SV l??m trung t??m";
    } else if (value == 4) {
      Desp =
          "Nhi???u ho???t ?????ng h???p d???n, l?? s??n ch??i ????? sinh vi??n c?? th??? t???a s??ng v???i ni???m ??am m?? c???a m??nh";
    }
    return SizedBox(
      width: double.infinity,
      height: 160.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Degree,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(
              width: 135.0,
              child: Divider(),
            ),
            Text(prof),
            const SizedBox(
              width: 140.0,
              child: Divider(),
            ),
            Text(Desp),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DONG A UNIVERSITY"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                print("Action button");
              },
              child: Icon(
                Icons.search,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Account 1"),
              accountEmail: const Text("SinhVien1gmail.com"),
              currentAccountPicture: const CircleAvatar(),
            ),
            ListTile(
              title: new Text("Trang c?? nh??n"),
              leading: new Icon(Icons.account_box),
            ),
            Divider(
              color: Colors.black,
            ),
            const ListTile(
              title: Text("C??i ?????t"),
              subtitle: Text('Quy???n ri??ng t??, B???o m???t, Ng??n ng???'),
              leading: Icon(Icons.settings),
            ),
            const Divider(
              color: Colors.black,
            ),
            const ListTile(
              title: Text("Tr??? gi??p"),
              leading: Icon(Icons.help_center_sharp),
            ),
            const Divider(
              color: Colors.black,
            ),
            ActionChip(
                label: Text("Profile"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                }),
            ActionChip(
                label: Text("logout"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 40.0),
        children: [
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: imageList
                  .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              e,
                              width: 1050.0,
                              height: 350.0,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
          const Divider(
            height: 50.0,
          ),
          //Card 1
          _BScard(1),
          _BSDetaisl(
              "TH??NG B??O TUY???N SINH",
              "????? ??n tuy???n sinh ?????i h???c n??m 2022 c???a ?????i h???c ????ng ?? ???? N???ng (D??? th???o)",
              1),
          //Card 2
          _BScard(2),
          _BSDetaisl("NG??Y H???I VI???C L??M",
              "Ng??y h???i vi???c l??m t???i c??c doang nghi???p Nh???t B???n", 2),
          //Card 3
          _BScard(3),
          _BSDetaisl(
              "CH????NG TR??NH ????O T???O", "Ch????ng tr??nh ????o t???o ti??n ti???n", 3),
          //Card 4
          _BScard(4),
          _BSDetaisl("M??I TR?????NG H???C T???P N??NG ?????NG",
              "??em ?????n cho sinh vi??n nhi???u tr???i nghi???m ?????c ????o", 4),
        ],
      ),
    );
  }
}

class SettingsScreen {}
