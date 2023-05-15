import 'dart:io';
import 'dart:typed_data';
import 'package:abox/view/screens/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class TextInfo {
  String text;
  double left;
  double top;
  Color color;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double fontSize;
  TextAlign textAlign;

  TextInfo({
    required this.text,
    required this.left,
    required this.top,
    required this.color,
    required this.fontWeight,
    required this.fontStyle,
    required this.fontSize,
    required this.textAlign,
  });
}

class EditProvider with ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  File file = File("zz");
  Offset offset = Offset.zero;
  Color textColor = const Color.fromARGB(255, 0, 0, 0);
  late Color backgroundColor;
  List<TextInfo> texts = [];
  int currentIndex = 0;

  void changeTextColor(Color color) {
    texts[currentIndex].color = color;
    notifyListeners();
  }

  void increaseFontSize() {
    texts[currentIndex].fontSize += 2;
    notifyListeners();
  }

  void decreaseFontSize() {
    texts[currentIndex].fontSize -= 2;
    notifyListeners();
  }

  void alignLeft() {
    texts[currentIndex].textAlign = TextAlign.left;
    notifyListeners();
  }

  void alignCenter() {
    texts[currentIndex].textAlign = TextAlign.center;
    notifyListeners();
  }

  void alignRight() {
    texts[currentIndex].textAlign = TextAlign.right;
    notifyListeners();
  }

  void boldText() {
    if (texts[currentIndex].fontWeight == FontWeight.bold) {
      texts[currentIndex].fontWeight = FontWeight.normal;
    } else {
      texts[currentIndex].fontWeight = FontWeight.bold;
    }
    notifyListeners();
  }

  void italicText() {
    if (texts[currentIndex].fontStyle == FontStyle.italic) {
      texts[currentIndex].fontStyle = FontStyle.normal;
    } else {
      texts[currentIndex].fontStyle = FontStyle.italic;
    }
    notifyListeners();
  }

  void addLinesToText() {
    if (texts[currentIndex].text.contains('\n')) {
      texts[currentIndex].text = texts[currentIndex].text.replaceAll('\n', ' ');
    } else {
      texts[currentIndex].text = texts[currentIndex].text.replaceAll(' ', '\n');
    }
    notifyListeners();
  }

  void removeText(BuildContext context) {
    texts.removeAt(currentIndex);
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 340),
        behavior: SnackBarBehavior.floating,
        width: 100,
        shape: StadiumBorder(),
        content: Text(
          'Deleted',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }

  void setCurrentIndex(BuildContext context, int index) {
    currentIndex = index;
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(milliseconds: 340),
        behavior: SnackBarBehavior.floating,
        width: 150,
        shape: StadiumBorder(),
        content: Text('Selected For Styling')));

    void showToast(String message) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    }

    void addNewText(BuildContext context) {
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

    Future<void> saveImage(Uint8List bytes) async {
      await [Permission.storage].request();
      final time = DateTime.now()
          .toIso8601String()
          .replaceAll('.', '_')
          .replaceAll(':', '_');
      final name = 'screenshot_$time';
      FilterQuality.high;
      final result = await ImageGallerySaver.saveImage(
        bytes,
        name: name,
        quality: 100,
      );
    }

    void addNewDialog(BuildContext context) {
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

    void uploadImage() async {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        file = selected;
        notifyListeners();
      }
    }

    void pickColor(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Background Color',
            style: TextStyle(fontSize: 15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColorPicker(
                pickerColor: backgroundColor,
                onColorChanged: (color) {
                  backgroundColor = color;
                  notifyListeners();
                },
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Select'),
              ),
            ],
          ),
        ),
      );
    }

    void pickTextColor(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Text Color',
            style: TextStyle(fontSize: 15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColorPicker(
                pickerColor: textColor,
                onColorChanged: (color) {
                  textColor = color;
                  notifyListeners();
                },
              ),
              TextButton(
                onPressed: () {
                  changeTextColor(textColor);
                  Navigator.of(context).pop();
                },
                child: const Text('Select'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
