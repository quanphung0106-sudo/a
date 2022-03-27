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

        ],
      ),
    );
  }
}