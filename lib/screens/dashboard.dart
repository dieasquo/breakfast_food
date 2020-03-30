import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_ui/common/palette.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/people.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Good\nMorning",
                        style: TextStyle(
                            height: 0.9,
                            fontSize: 40,
                            fontFamily: CFont.montserratBold,
                            color: Colors.green),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Popular Food",
                        style: TextStyle(
                            fontFamily: CFont.montserratBold,
                            fontSize: 16,
                            color: CColor.txtColor),
                      ),
                    ],
                  )),
              Container(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    itemFoods(
                        imgPath: ImgAsset.plat1, price: "3", title: "Dish"),
                    itemFoods(
                        imgPath: ImgAsset.plat2, price: "1", title: "Salad"),
                    itemFoods(
                        imgPath: ImgAsset.plat3, price: "2", title: "Pecel"),
                    itemFoods(
                        imgPath: ImgAsset.plat4, price: "1.2", title: "Rawon"),
                    SizedBox(width: 30)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  "Best Food",
                  style: TextStyle(
                      fontFamily: CFont.montserratBold,
                      color: CColor.txtColor,
                      fontSize: 16),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    bestFood(
                        imgPath: ImgAsset.plat3,
                        title: "Rawon",
                        desc: "The Most Spicy food int this town"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              navMenuItem(Icons.home, () {}),
              navMenuItem(Icons.search, () {}),
              navMenuItem(Icons.shopping_basket, () {}),
              navMenuItem(Icons.person, () {}),
            ],
          ),
        ),
      ),
    );
  }
}

Widget navMenuItem(IconData icon, VoidCallback onPress) {
  return SizedBox(
    width: 60,
    child: FlatButton(
      onPressed: onPress,
      splashColor: Colors.green,
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
    ),
  );
}

Widget itemFoods({String title, String price, String imgPath}) {
  return Container(
    width: 200,
    height: 200,
    margin: EdgeInsets.only(bottom: 15, top: 20, left: 30),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          blurRadius: 6,
          spreadRadius: 2,
          color: Colors.grey[300],
          offset: Offset(3, 4))
    ], color: CColor.bgColor, borderRadius: BorderRadius.circular(15)),
    child: Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            print("tapped item");
          },
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey[100],
                    Colors.lightGreen[400],
                  ],
                ),
                image: DecorationImage(image: AssetImage(imgPath)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          ),
        ),
        Positioned(
          right: 12,
          top: 135,
          child: Container(
            height: 35,
            width: 35,
            child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 20,
                ),
                onPressed: () {
                  print("tapped icon");
                }),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 5,
                      spreadRadius: 3,
                      offset: Offset(3, 3))
                ]),
          ),
        ),
        Positioned(
            left: 15,
            top: 155,
            child: Text(
              title,
              style: TextStyle(fontFamily: CFont.montserratBold),
            )),
        Positioned(
            left: 15,
            top: 180,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 2),
                  child: Text("4.0"),
                ),
                Icon(Icons.star, size: 15, color: Colors.green),
                Icon(Icons.star, size: 15, color: Colors.green),
                Icon(Icons.star, size: 15, color: Colors.green),
                Icon(Icons.star, size: 15, color: Colors.green),
                Icon(Icons.star, size: 15, color: Colors.grey),
              ],
            )),
        Positioned(
          child: Text("\$ $price",
              style: TextStyle(fontFamily: CFont.montserratBold)),
          bottom: 10,
          right: 15,
        ),
      ],
    ),
  );
}

Widget bestFood({String title, String desc, String imgPath}) {
  return Container(
    padding: EdgeInsets.only(top: 20),
    height: 200,
    margin: EdgeInsets.only(bottom: 15, top: 20, left: 30, right: 30),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[100],
            Colors.lightGreen[400],
          ],
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 6,
              spreadRadius: 2,
              color: Colors.grey[300],
              offset: Offset(3, 4))
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imgPath))),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned(
          child: Container(
            height: 55,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      color: Colors.grey[400],
                      offset: Offset(0, -2)),
                ],
                color: Colors.grey[300],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
          ),
        ),
        Positioned(
          child: Text(
            title,
            style: TextStyle(fontFamily: CFont.montserratBold, fontSize: 16),
          ),
          bottom: 30,
          left: 20,
        ),
        Positioned(
          child: Text(
            desc,
            style: TextStyle(
                color: CColor.txtColor,
                fontFamily: CFont.montserrat,
                fontSize: 14),
          ),
          bottom: 8,
          left: 20,
        ),
      ],
    ),
  );
}
