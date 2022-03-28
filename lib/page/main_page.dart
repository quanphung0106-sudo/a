import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main () {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: chatapp(),
  ));
}

class chatapp extends StatefulWidget {
  const chatapp({Key? key}) : super(key: key);

  @override
  _chatappState createState() => _chatappState();

}


class _chatappState extends State<chatapp> {

  final List<String> imageList = [
    "https://media.istockphoto.com/photos/happy-students-walking-together-in-campus-having-break-picture-id1165683016?k=20&m=1165683016&s=612x612&w=0&h=Rzay--91ScZFiD-eJL6o6jA3v3AUBokbaOEjxgPGzSQ=",
    "https://media.istockphoto.com/photos/happy-black-student-raising-arm-to-answer-question-while-attending-picture-id1307457391?k=20&m=1307457391&s=612x612&w=0&h=Rj2wqBSqQ6iwwIPwRrdtpO7RAjkS4JrWtA7QjvZUgyc=",
    "https://media.istockphoto.com/photos/business-people-working-picture-id1169096513?k=20&m=1169096513&s=612x612&w=0&h=mnUKKSMIajgo9y8W4aisHIhAvdzByLzqUW5vsmZBl7E=",
    "https://media.istockphoto.com/photos/graduation-day-picture-id1066324992?k=20&m=1066324992&s=612x612&w=0&h=IThBZfVQnjL1mCR5fivmqigAhCPL_RkRzGuaSisNXrc=",
  ];

  Widget _BScard(int value){
    String url="";
    if(value ==1) {
      url = "https://media.istockphoto.com/photos/university-application-form-picture-id168367619?k=20&m=168367619&s=612x612&w=0&h=TLPr2sgJ-3d1R6xH8QJ9DtGt1FoXE5xduX0xGf_9WPw=";
    }else if(value==2){
      url ="https://media.istockphoto.com/photos/group-of-diverse-multiethnic-people-with-various-jobs-picture-id513957135?k=20&m=513957135&s=612x612&w=0&h=Pb5ooTjGpFUwW6rz3bM_asypplABHCQJ_6QhqB5dakw=";
    }else if(value==3){
      url ="https://media.istockphoto.com/photos/delivering-an-informative-presentation-like-a-pro-picture-id1141464027?k=20&m=1141464027&s=612x612&w=0&h=gyoKUv7vRVS6MWUjBCLWOu9Gu2WpQmk9W868HyEHvVA=";
    }else if(value==4){
      url ="https://media.istockphoto.com/photos/group-of-volunteers-with-surgical-masks-cleaning-nature-together-picture-id1265552575?k=20&m=1265552575&s=612x612&w=0&h=qopAHOutHxR50odcGoWOQqfkAmYuyCZTYndDojcHWn8=";
    }
    return Card(
      child: Image.network(url,
        fit: BoxFit.fill,
        width: 140.0,
        height: 150.0,
      ),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
    );
  }

  Widget _BSDetaisl(String Degree, String prof, int value){
    String  Desp="";
    if(value==1){
      Desp="Nhằm cung cấp đầy đủ thông tin về ngành nghề, tạo điều kiện cho thí sinh có nhiều cơ hội xét tuyển vào Đại học. Đại học Đông Á thông báo tuyển sinh 2022. Thời gian nhận hồ sơ bắt đầu từ 01/03/2022";
    }else if(value==2){
      Desp="Năm nay đã là năm thứ 6 trường Đại học Đông Á kết hợp cùng công ty SEKISHO VIỆT NAM tổ chức Ngày hội việc làm với tên gọi “SEKISHO JOB FAIR”";
    }else if(value==3){
      Desp="Theo định hướng ứng dụng và nghề nghiệp, hội nhập quốc tế. Chương trình đào tạo lấy SV làm trung tâm";
    }else if(value==4){
      Desp="Nhiều hoạt động bổ ích và hấp dẫn, là sân chơi để sinh viên có thể tỏa sáng với niềm đam mê của mình";
    }
    return  SizedBox(
      width: double.infinity,
      height: 160.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Degree, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
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
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Account 1"),
              accountEmail: const Text("SinhVien2gmail.com"),
              currentAccountPicture: const CircleAvatar(

              ),
            ),
            ListTile(
              title: new Text("Profile"),
              leading: new Icon(Icons.account_box),
            ),
            Divider(color: Colors.black,),
            const ListTile(
              title: Text("Setting"),
              leading: Icon(Icons.settings),
            ),
            const Divider(color: Colors.black,),
            const ListTile(
              title:  Text("LogOut"),
              leading: Icon(Icons.logout_outlined),
            ),
            const Divider(color: Colors.black,),
            const ListTile(
              title: Text("Help"),
              leading: Icon(Icons.help_center_sharp),
            ),
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
              items: imageList.map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(e,
                      width: 1050.0,
                      height: 350.0,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              )).toList(),
            ),
          ),
          const Divider(height: 50.0,),
          //Card 1
          _BScard(1),
          _BSDetaisl("THÔNG BÁO TUYỂN SINH", "Đề án tuyển sinh đại học năm 2022 của Đại học Đông Á Đà Nẵng (Dự thảo)",1),
          //Card 2
          _BScard(2),
          _BSDetaisl("NGÀY HỘI VIỆC LÀM", "Ngày hội việc làm tại các doang nghiệp Nhật Bản",2),
          //Card 3
          _BScard(3),
          _BSDetaisl("CHƯƠNG TRÌNH ĐÀO TẠO", "Chương trình đào tạo tiên tiến",3),
          //Card 4
          _BScard(4),
          _BSDetaisl("MÔI TRƯỜNG HỌC TẬP NĂNG ĐỘNG", "Đem đến cho sinh viên nhiều trải nghiệm độc đáo",4),
        ],
      ),
    );
  }
}