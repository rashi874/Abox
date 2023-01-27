import 'package:abox/controller/providers/edit_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:abox/View/screens/widgets/image_text.dart';
import 'package:abox/View/widgets/screehome/const.dart';

// ignore: must_be_immutable
class HorizontalEditing extends StatelessWidget {
  String? title, image, appbartitle, mock;
  Color? color;
  // ignore: prefer_typing_uninitialized_variables
  var radiuses;
  HorizontalEditing({
    Key? key,
    this.title,
    this.color,
    this.image,
    this.appbartitle,
    this.mock,
    required this.radiuses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<EditProvider>(context, listen: false).coler(color);

    return Consumer<EditProvider>(builder: (context, appservices, _) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text(
            appbartitle!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            kbox10,
            Center(
              child: Screenshot(
                controller: appservices.screenshotController,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: appservices.bgcolor,
                    // borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                      // alignment: AlignmentDirectional.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // (texts[0] == null)
                            //     ? Text('name')
                            // ImageText(textInfo: texts[0]),
                            // ImageText(textInfo: texts[0]),
                            // Padding(
                            //   padding: const EdgeInsets.all(20.0),
                            //   child: TextFormField(
                            //     onTap: () => addNewDialog(context),
                            //     minLines: 2,
                            //     maxLines: 2,
                            //     style: TextStyle(
                            //       fontSize: 15,
                            //       fontWeight: FontWeight.w500,
                            //       color: textcolor,
                            //     ),
                            //     textAlign: TextAlign.center,
                            //     controller: _email,
                            //     // cursorColor: const Color.fromARGB(255, 177, 0, 0),
                            //     decoration: InputDecoration(
                            //         hintMaxLines: 3,
                            //         hintStyle: TextStyle(color: textcolor),
                            //         border: InputBorder.none,
                            //         focusedBorder: InputBorder.none,
                            //         enabledBorder: InputBorder.none,
                            //         errorBorder: InputBorder.none,
                            //         disabledBorder: InputBorder.none,
                            //         contentPadding: const EdgeInsets.all(5),
                            //         hintText: (text != null)
                            //             ? ' ${title!.toUpperCase()}'
                            //             : texts[0].text),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                kboxwidth10,
                                Container(
                                  // padding: const EdgeInsets.all(10.0),
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    // color: colors[0],
                                    // borderRadius: BorderRadius.circular(10),
                                    // border: Border.all(
                                    //   color: colors[2],
                                    //   width: .5,
                                    // ),
                                    color: color,
                                    borderRadius: radiuses,
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.antiAlias,
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      (appservices.file.path == "zz")
                                          ? Center(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.asset(
                                                  image!,
                                                  width: 70,
                                                  height: 151,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.file(
                                                  appservices.file,
                                                  fit: BoxFit.fill,
                                                  width: 70,
                                                  height: 150,
                                                  filterQuality:
                                                      FilterQuality.high,
                                                ),
                                              ),
                                            ),
                                      Center(
                                        child: Container(
                                          width: 75,
                                          height: 152,
                                          decoration: BoxDecoration(
                                            // borderRadius:
                                            //     BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(mock!),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // )
                          ],
                        ),
                        for (int i = 0; i < appservices.texts.length; i++)
                          Positioned(
                            left: appservices.texts[i].left,
                            top: appservices.texts[i].top,
                            child: GestureDetector(
                              onLongPress: () {
                                appservices.currentintex(i, context);
                              },
                              onTap: () =>
                                  appservices.setCurrentIndex(context, i),
                              child: Draggable(
                                feedback: Material(
                                    type: MaterialType.transparency,
                                    child: ImageText(
                                        textInfo: appservices.texts[i])),
                                child: Material(
                                    type: MaterialType.transparency,
                                    child: ImageText(
                                        textInfo: appservices.texts[i])),
                                onDragEnd: (drag) {
                                  final renderBox =
                                      context.findRenderObject() as RenderBox;
                                  Offset off =
                                      renderBox.globalToLocal(drag.offset);
                                  appservices.initintexhorizontal(i, off);
                                },
                              ),
                            ),
                          ),
                        appservices.creatorText.text.isNotEmpty
                            ? Positioned(
                                left: 0,
                                bottom: 0,
                                child: Text(
                                  appservices.creatorText.text,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(
                                        0.3,
                                      )),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ]),
                ),
              ),
            ),
            kbox20,
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: colors[0],
                  ),
                  child: IconButton(
                    onPressed: () => appservices.addNewDialog(context),
                    //     minLines: 2,
                    //     maxLines: 2,
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.w500,
                    //       color: textcolor,
                    //     ),,
                    icon: const Icon(
                      Icons.text_fields_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 218, 218, 218),
                ),
                // image upload in device
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colors[0],
                      ),
                      child: IconButton(
                        onPressed: () => appservices.uploadImage(),
                        icon: const Icon(
                          Icons.add_photo_alternate_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colors[0],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const Text('Background'),
                          IconButton(
                            onPressed: () {
                              // appservices.builColorPicker(color);
                              appservices.pickColor(
                                context,
                              );
                            },
                            icon: const Icon(
                              Icons.format_color_fill_rounded,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            color: color,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colors[0],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const Text('Text color'),
                          IconButton(
                            onPressed: () {
                              appservices.textpickColor(context);
                            },
                            icon: const Icon(
                              Icons.format_color_text_rounded,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            color: appservices.textcolor,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colors[0],
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.downloading_rounded,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // saveToGallery(context);
                              appservices.screenshotController
                                  .capture(
                                      delay: const Duration(milliseconds: 0))
                                  .then((capturedImage) async {
                                appservices.saveImage(capturedImage!);
                                appservices.showToast(" image saved");
                              }).catchError((onError) {
                                // print(onError);
                              });
                            },

                            //  saveToGallery(context),,
                            tooltip: 'Save Image',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          onPressed: appservices.increaseFontSize,
                          tooltip: 'Increase font size',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                          onPressed: appservices.decreaseFontSize,
                          tooltip: 'Decrease font size',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_align_left,
                            color: Colors.black,
                          ),
                          onPressed: appservices.alignLeft,
                          tooltip: 'Align left',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_align_center,
                            color: Colors.black,
                          ),
                          onPressed: appservices.alignCenter,
                          tooltip: 'Align Center',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_align_right,
                            color: Colors.black,
                          ),
                          onPressed: appservices.alignRight,
                          tooltip: 'Align Right',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_bold,
                            color: Colors.black,
                          ),
                          onPressed: appservices.boldText,
                          tooltip: 'Bold',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_italic,
                            color: Colors.black,
                          ),
                          onPressed: appservices.italicText,
                          tooltip: 'Italic',
                        ),

                        IconButton(
                          icon: const Icon(
                            Icons.space_bar,
                            color: Colors.black,
                          ),
                          onPressed: appservices.addLinesToText,
                          tooltip: 'Add New Line',
                        ),
                        // Tooltip(
                        //   message: 'Red',
                        //   child: GestureDetector(
                        //       onTap: () => changeTextColor(Colors.red),
                        //       child: const CircleAvatar(
                        //         backgroundColor: Colors.red,
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Tooltip(
                        //   message: 'White',
                        //   child: GestureDetector(
                        //       onTap: () => changeTextColor(Colors.white),
                        //       child: const CircleAvatar(
                        //         backgroundColor: Colors.white,
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Tooltip(
                        //   message: 'Black',
                        //   child: GestureDetector(
                        //       onTap: () => changeTextColor(Colors.black),
                        //       child: const CircleAvatar(
                        //         backgroundColor: Colors.black,
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Tooltip(
                        //   message: 'Blue',
                        //   child: GestureDetector(
                        //       onTap: () => changeTextColor(Colors.blue),
                        //       child: const CircleAvatar(
                        //         backgroundColor: Colors.blue,
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Tooltip(
                        //   message: 'Yellow',
                        //   child: GestureDetector(
                        //       onTap: () => changeTextColor(Colors.yellow),
                        //       child: const CircleAvatar(
                        //         backgroundColor: Colors.yellow,
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Tooltip(
                        //   message: 'Green',
                        //   child: GestureDetector(
                        //       onTap: () => changeTextColor(Colors.green),
                        //       child: const CircleAvatar(
                        //         backgroundColor: Colors.green,
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Tooltip(
                        //   message: 'Orange',
                        //   child: GestureDetector(
                        //       onTap: () => changeTextColor(Colors.orange),
                        //       child: const CircleAvatar(
                        //         backgroundColor: Colors.orange,
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Tooltip(
                        //   message: 'Pink',
                        //   child: GestureDetector(
                        //       onTap: () => changeTextColor(Colors.pink),
                        //       child: const CircleAvatar(
                        //         backgroundColor: Colors.pink,
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     screenshotController
            //         .capture(delay: const Duration(milliseconds: 0))
            //         .then((capturedImage) async {
            //       saveImage(capturedImage!);
            //       showToast(" image saved");
            //     }).catchError((onError) {
            //       // print(onError);
            //     });
            //     // print(screenshotController);
            //     // print(saveImage);
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor:
            //         const Color.fromARGB(229, 140, 247, 165).withOpacity(0.6),
            //     elevation: 0,
            //     shape: const StadiumBorder(),
            //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //   ),
            //   child: const Text(
            //     'Save',
            //     style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //         color: Color.fromARGB(255, 10, 10, 10)),
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
