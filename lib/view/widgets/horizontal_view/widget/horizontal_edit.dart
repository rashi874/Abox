import 'package:abox/const.dart';
import 'package:abox/controller/providers/ads_provider.dart';
import 'package:abox/controller/providers/edit_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:abox/View/screens/widgets/image_text.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Provider.of<EditProvider>(context, listen: false).coler(color);
    final prov = Provider.of<AdsProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      prov.createInlineBannerAd3(context);
      prov.loadRewardedAd();
    });
    return Consumer2<EditProvider, AdsProvider>(
        builder: (context, appservices, adsservices, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            appbartitle!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            adsservices.isinlineBannerAdAdLoaded
                ? Material(
                    color: AppColors().kblue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height:
                            adsservices.bottomBannerAd?.size.height.toDouble(),
                        width:
                            adsservices.bottomBannerAd?.size.width.toDouble(),
                        child: AdWidget(ad: adsservices.inlineBannerAd!),
                      ),
                    ))
                : const SizedBox(
                    // height: 1,
                    child: Text('AD'),
                  ),
            Center(
              child: Screenshot(
                controller: appservices.screenshotController,
                child: Container(
                  width: screenWidth,
                  height: screenHeight / 4.2,
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
                                  width: screenWidth / 3,
                                  height: screenHeight / 4.2,
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
                                                  width: screenWidth / 5.2,
                                                  height: screenHeight / 5.8,
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
                                                  width: screenWidth / 5.4,
                                                  height: screenHeight / 5.9,
                                                  filterQuality:
                                                      FilterQuality.high,
                                                ),
                                              ),
                                            ),
                                      Center(
                                        child: Container(
                                          width: screenWidth / 5.1,
                                          height: screenHeight / 5.7,
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
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black.withOpacity(
                                    //   0.3,
                                    // ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ]),
                ),
              ),
            ),
            // kbox20,
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: colors[0],
                  ),
                  child: IconButton(
                    onPressed: () => appservices.addNewDialog(context),
                    icon: const Icon(
                      Icons.text_fields_rounded,
                    ),
                  ),
                ),
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
                          IconButton(
                            onPressed: () {
                              appservices.pickColor(
                                context,
                              );
                            },
                            icon: const Icon(
                              Icons.format_color_fill_rounded,
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
                          IconButton(
                            onPressed: () {
                              appservices.textpickColor(context);
                            },
                            icon: const Icon(
                              Icons.format_color_text_rounded,
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
                            ),
                            onPressed: () {
                              adsservices.rewardedAd?.show(
                                onUserEarnedReward: (_, reward) {},
                              );
                              appservices.screenshotController
                                  .capture(
                                      delay: const Duration(milliseconds: 0))
                                  .then((capturedImage) async {
                                appservices.saveImage(capturedImage!);
                                appservices.showToast(" image saved");
                              }).catchError((onError) {});
                            },
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
                          ),
                          onPressed: appservices.increaseFontSize,
                          tooltip: 'Increase font size',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                          ),
                          onPressed: appservices.decreaseFontSize,
                          tooltip: 'Decrease font size',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_align_left,
                          ),
                          onPressed: appservices.alignLeft,
                          tooltip: 'Align left',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_align_center,
                          ),
                          onPressed: appservices.alignCenter,
                          tooltip: 'Align Center',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_align_right,
                          ),
                          onPressed: appservices.alignRight,
                          tooltip: 'Align Right',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_bold,
                          ),
                          onPressed: appservices.boldText,
                          tooltip: 'Bold',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.format_italic,
                          ),
                          onPressed: appservices.italicText,
                          tooltip: 'Italic',
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.space_bar,
                          ),
                          onPressed: appservices.addLinesToText,
                          tooltip: 'Add New Line',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
