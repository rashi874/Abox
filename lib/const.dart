import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// const List kimage = [
//   "assets/images/1.png",
//   "assets/images/2.png",
//   "assets/images/3.png",
//   "assets/images/4.png",
//   "assets/images/5.png",
//   "assets/images/6.png",
//   "assets/images/7.png",
//   "assets/images/8.png",
// ];

const bck = 'assets/images/bck.png';
const bck1 = 'assets/images/bck1.png';
const logo = 'assets/images/playstore.png';
final List<Color> colors = [
  const Color.fromARGB(255, 39, 107, 243).withOpacity(0.2),
  const Color.fromARGB(255, 243, 151, 39).withOpacity(0.2),
  const Color.fromARGB(255, 87, 39, 243).withOpacity(0.2),
  const Color.fromARGB(255, 157, 242, 146).withOpacity(0.2),
  const Color.fromARGB(255, 243, 39, 39).withOpacity(0.2),
  const Color.fromARGB(255, 39, 107, 243).withOpacity(0.2),
  const Color.fromARGB(255, 243, 151, 39).withOpacity(0.2),
  const Color.fromARGB(255, 87, 39, 243).withOpacity(0.2),
  const Color.fromARGB(255, 157, 242, 146).withOpacity(0.2),
  const Color.fromARGB(255, 243, 39, 39).withOpacity(0.2),
];

const List models = [
  BorderRadius.only(
    topRight: Radius.circular(10),
    topLeft: Radius.circular(50),
    bottomLeft: Radius.circular(0),
    bottomRight: Radius.circular(50),
  ),
  BorderRadius.only(
    topRight: Radius.circular(10),
    topLeft: Radius.circular(50),
    bottomLeft: Radius.circular(50),
    bottomRight: Radius.circular(0),
  ),
  BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  ),
  BorderRadius.all(Radius.circular(0)),
  BorderRadius.all(Radius.circular(100)),
];
const List temp = [
  "assets/images/temp2.png",
  "assets/images/temp3.png",
  "assets/images/temp.png",
  "assets/images/temp8.png",
  "assets/images/temp7.png",
];
//  const Color.fromARGB(255, 27, 91, 169).withOpacity(0.8),
//   Color.fromARGB(255, 25, 102, 62).withOpacity(0.8),
//   const Color.fromARGB(255, 38, 51, 110).withOpacity(0.8),
//   Color.fromARGB(255, 57, 2, 19).withOpacity(0.8),
List text(
  name,
) {
  List temptext = [
    name,
    'Iphone 14 pro',
    'Iphone 13 ',
    'Pixel 7',
    'Galaxy S10',
  ];
  return temptext;
}

List data(os) {
  String? type;
  if (os == 'web') {
    type = 'Web';
  } else if (os == 'android' || os == 'ios') {
    type = 'App';
  }
  List<String> ktext = [
    "Create Beautiful App Screenshots Like This",
    "Show Off Your $type In The Best Way ",
    "Create Standout App Screenshots Like This ",
    "Create Beautiful App Screenshots Like This",
    "Show Off Your App In The Best Way ",
    "Create Standout App Screenshots Like This ",
    "Create Beautiful App Screenshots Like This",
    "Show Off Your App In The Best Way ",
  ];
  return ktext;
}

const List<String> ktext = [
  "Create Beautiful App Screenshots Like This",
  "Show Off Your App In The Best Way ",
  "Create Standout App Screenshots Like This ",
  "Create Beautiful App Screenshots Like This",
  "Show Off Your App In The Best Way ",
  "Create Standout App Screenshots Like This ",
  "Create Beautiful App Screenshots Like This",
  "Show Off Your App In The Best Way ",
];

const kmodelimg1 = "assets/images/temp.png";
const kmodelimg2 = "assets/images/temp2.png";
const kmodelimg3 = "assets/images/temp3.png";
const avatar = "assets/images/avatar.jpg";
const homeshot = "assets/images/8.png";
const temp2text = ('Create your\nAppScreens now!');
const temp2textsub = (' Show your app how it should be seen!');

const List imageurl = [
  "https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/60107f092368c244d1ab47b7_6002086f72b727d98501e58e_soft-html.jpeg",
  "https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/60107f08f2695e0e5f883bd6_6002086f72b727617601e57f_acorns.jpeg",
  "https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/60107f09d58c7fd7c8c2aa1f_6002086f72b72753ae01e57e_shirt-app.jpeg",
];

const kbox20 = SizedBox(
  height: 20,
);
const kbox10 = SizedBox(
  height: 10,
);
const kbox2 = SizedBox(
  height: 3,
);
const kboxwidth10 = SizedBox(
  width: 10,
);
const kboxwidth5 = SizedBox(
  width: 5,
);

class AppColors {
  Color kblue = Color(0xffA5B8EF);
  Color kwhite = Colors.white;
  Color kblack = Colors.black;
}
