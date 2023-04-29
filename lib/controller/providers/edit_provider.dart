import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:abox/ad_helper.dart';
import 'package:abox/models/text_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:abox/view/screens/widgets/default_button.dart';
import 'package:screenshot/screenshot.dart';

class EditProvider with ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  File file = File("zz");
  Offset offset = Offset.zero;

  Color textcolor = const Color.fromARGB(255, 0, 0, 0);
  late Color bgcolor;

  coler(color) {
    bgcolor = color;
  }

  List<TextInfo> texts = [];
  int currentIndex = 0;
  currentintex(i, context) {
    currentIndex = i;
    removeText(context);
    notifyListeners();
  }

  initintexverticle(i, off) {
    texts[i].top = off.dy - 96;
    texts[i].left = off.dx - 30;
    notifyListeners();
  }

  initintexhorizontal(i, off) {
    texts[i].top = off.dy - 200;
    texts[i].left = off.dx;
    notifyListeners();
  }
  // saveToGallery(BuildContext context) {
  //   if (texts.isNotEmpty) {
  //     screenshotController.capture().then((Uint8List? image) {
  //       saveImage(image!);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Image saved to gallery.'),
  //         ),
  //       );
  //     }).catchError((err) => print(err));
  //   }
  // }

  // saveImage(Uint8List bytes) async {
  //   final time = DateTime.now()
  //       .toIso8601String()
  //       .replaceAll('.', '-')
  //       .replaceAll(':', '-');
  //   final name = "screenshot_$time";
  //   await requestPermission(Permission.storage);
  //   await ImageGallerySaver.saveImage(bytes, name: name);
  // }

  removeText(BuildContext context) {
    texts.removeAt(currentIndex);
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 340),
        backgroundColor: Color.fromARGB(255, 255, 112, 90),
        behavior: SnackBarBehavior.floating,
        width: 100,
        shape: StadiumBorder(),
        content: Text(
          'Deleted',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  setCurrentIndex(BuildContext context, index) {
    currentIndex = index;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 340),
        backgroundColor: Color.fromARGB(255, 244, 232, 196),
        behavior: SnackBarBehavior.floating,
        width: 150,
        shape: StadiumBorder(),
        content: Text(
          'Selected For Styling',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  changeTextColor() {
    texts[currentIndex].color = textcolor;
    notifyListeners();
  }

  increaseFontSize() {
    texts[currentIndex].fontSize += 2;
    notifyListeners();
  }

  decreaseFontSize() {
    texts[currentIndex].fontSize -= 2;
    notifyListeners();
  }

  alignLeft() {
    texts[currentIndex].textAlign = TextAlign.left;
    notifyListeners();
  }

  alignCenter() {
    texts[currentIndex].textAlign = TextAlign.center;
    notifyListeners();
  }

  alignRight() {
    texts[currentIndex].textAlign = TextAlign.right;
    notifyListeners();
  }

  boldText() {
    if (texts[currentIndex].fontWeight == FontWeight.bold) {
      texts[currentIndex].fontWeight = FontWeight.normal;
    } else {
      texts[currentIndex].fontWeight = FontWeight.bold;
    }
    notifyListeners();
  }

  italicText() {
    if (texts[currentIndex].fontStyle == FontStyle.italic) {
      texts[currentIndex].fontStyle = FontStyle.normal;
    } else {
      texts[currentIndex].fontStyle = FontStyle.italic;
    }
    notifyListeners();
  }

  addLinesToText() {
    if (texts[currentIndex].text.contains('\n')) {
      texts[currentIndex].text = texts[currentIndex].text.replaceAll('\n', ' ');
    } else {
      texts[currentIndex].text = texts[currentIndex].text.replaceAll(' ', '\n');
    }
    notifyListeners();
  }

  addNewText(BuildContext context) {
    texts.add(
      TextInfo(
        text: textEditingController.text,
        left: 100,
        top: 50,
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        textAlign: TextAlign.center,
      ),
    );
    Navigator.of(context).pop();

    notifyListeners();
  }

  // Future<String> saveImage(Uint8List bytes) async {
  //   await [Permission.storage].request();
  //   final time = DateTime.now()
  //       .toIso8601String()
  //       .replaceAll('.', '_')
  //       .replaceAll(':', '_');
  //   final name = 'screenshot_$time';
  //   FilterQuality.high;
  //   final result = await ImageGallerySaver.saveImage(
  //     bytes,
  //     name: name,
  //     quality: 300,
  //   );
  //   if (result) {
  //     // print('selected');
  //   }
  //   return result['filepath'];
  // }

  Future<Uint8List> saveImage(Uint8List list) async {
    await [Permission.storage].request();
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 135,
    );
    log(list.length.toString());
    print(result.length);
    return result;
  }

  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Add New Text',
          style: TextStyle(fontSize: 16),
        ),
        content: TextFormField(
          controller: textEditingController,
          maxLines: 5,
          maxLength: 40,
          // decoration: const InputDecoration(
          //   suffixIcon: Icon(
          //     Icons.edit,
          //   ),
          //   filled: true,
          //   hintText: 'Your Text Here..',
          // ),
        ),
        actions: <Widget>[
          DefaultButton(
            onPressed: () => Navigator.of(context).pop(),
            color: const Color.fromARGB(137, 244, 91, 91),
            textColor: const Color.fromARGB(255, 0, 0, 0),
            child: const Text('Back'),
          ),
          DefaultButton(
            onPressed: () {
              addNewText(context);
              textEditingController.clear();
            },
            color: const Color.fromARGB(176, 65, 153, 200),
            textColor: Colors.black,
            child: const Text('Add Text'),
          ),
        ],
      ),
    );
  }

  uploadImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      var selected = File(image.path);

      file = selected;
      notifyListeners();

      // showToast(" file selected");
    } else {
      // showToast("No file selected");
    }
  }

//background color picker

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 15.0,
    );
  }

  Widget builColorPicker() => ColorPicker(
      pickerColor: bgcolor,
      onColorChanged: (color) {
        notifyListeners();
        bgcolor = color;
      });

  pickColor(
    BuildContext context,
  ) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                'background color',
                style: TextStyle(fontSize: 15),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  builColorPicker(),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Select',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ));
  }

// text color picker

  Widget textbuilColorPicker() => ColorPicker(
      pickerColor: textcolor,
      onColorChanged: (color) {
        notifyListeners();
        textcolor = color;
      });

  void textpickColor(BuildContext context) => {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Text color',
              style: TextStyle(fontSize: 15),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                textbuilColorPicker(),
                TextButton(
                    onPressed: () {
                      changeTextColor();
                      notifyListeners();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Select',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ),
        )
      };
}
