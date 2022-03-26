import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green
        ),
        home: chatapp(),
      )
  );
}

class chatapp extends StatefulWidget {
  const chatapp({Key? key}) : super(key: key);

  @override
  _chatappState createState() => _chatappState();

}

class _chatappState extends State<chatapp> {

  final List<String> imageList = [
    "https://wenr.wes.org/wp-content/uploads/2019/09/iStock-1142918319_WENR_Ranking_740_430.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOh2gJ9eXdaox-uRpAz3oqWtjDlJ3k0AukWgxlzXg07nH71OpRzx20BZG9JcxkxH3loZc&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnj7GvtqijGyb2focyFejrmqJk1g_Bcjl2qg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV7vJmRomAsYtE3JazzOxK61x63rrsfilphA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0YpfIsnCgTkcz39Z_4-EzgbDsDqh9T0wPfA&usqp=CAU"

  ];

  Widget _BScard(int value){
    String url="";
    if(value==1){
      url = "https://kinhte.donga.edu.vn/Portals/24/57611771_134292844397479_6609881241783107584_o.jpg";
    }
    return  Card(
      child: Image.network(url,
        fit: BoxFit.fill,
        width: 150.0,
        height: 150.0,
      ),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
    );
  }

  Widget _BSCDetails(){
    return SizedBox(
        width: double.infinity,
        height:140.0 ,
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("BSCS (4 YEARS)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                SizedBox(
                  width: 135.0,
                  child: Divider(),
                ),
                Text("HỌC PHÍ: ỔN ĐỊNH TRONG CẢ KHÓA HỌC"),
                SizedBox(
                  width: 170.0,
                  child: Divider(),
                ),
                Text("Riêng các ngành Kỹ thuật: Công nghệ thông tin, Trí tuệ nhân tạo và Khoa học dữ liệu, Công nghệ Kỹ thuật Ô tô là 570.000 đ/1 tín chỉ và ngành Dược: 835.000 đ/1 tín chỉ."),
                SizedBox(
                  width: 100.0,
                  child: Divider(),
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 40.0),
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
                child:  Stack(
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
          new Divider(height: 50.0,),
          _BScard(1),
          _BSCDetails(),
        ],
      ),
    );
  }
}
