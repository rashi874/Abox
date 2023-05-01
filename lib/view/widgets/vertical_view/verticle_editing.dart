import 'package:abox/View/screens/widgets/image_text.dart';
import 'package:abox/const.dart';
import 'package:abox/controller/providers/ads_provider.dart';
import 'package:abox/controller/providers/edit_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';


// ignore: must_be_immutable
class VerticleEditing extends StatelessWidget {
  VerticleEditing({
    super.key,
    required this.bgscolor,
    required this.image,
    required this.appbartitle,
    required this.mock,
  });

  String? appbartitle, image, mock;
  Color? bgscolor;
  @override
  Widget build(BuildContext context) {
    Provider.of<EditProvider>(context, listen: false).coler(bgscolor);
    final prov = Provider.of<AdsProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      prov.createBottomBannerAd(context);
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
                // SizedBox(
                //   height: MediaQuery.of(context).size.width * 0.1,
                // ),
                adsservices.isBottomBannerAdLoaded
                    ? SizedBox(
                        height:
                            adsservices.bottomBannerAd?.size.height.toDouble(),
                        width:
                            adsservices.bottomBannerAd?.size.width.toDouble(),
                        child: AdWidget(ad: adsservices.bottomBannerAd!),
                      )
                    : const SizedBox(
                        // height: 1,
                        child: Text('AD'),
                      ),
                Center(
                  child: Screenshot(
                    controller: appservices.screenshotController,
                    child: Container(
                      height: 460,
                      width: 300,
                      decoration: BoxDecoration(
                        color: appservices.bgcolor,
                        // borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Stack(
                              clipBehavior: Clip.antiAlias,
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      color: const Color.fromARGB(
                                          22, 255, 255, 255)),
                                ),
                                (appservices.file.path == "zz")
                                    ? Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          child: Image.asset(
                                            image!,
                                            width: 160,
                                            height: 341,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          child: Image.file(
                                            appservices.file,
                                            fit: BoxFit.fill,
                                            width: 160,
                                            height: 341,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                      ),
                                Center(
                                  child: Container(
                                    width: 175,
                                    height: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(mock!),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                  appservices.initintexverticle(i, off);
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
                Column(children: [
                  Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: colors[3],
                    ),
                    child: IconButton(
                      onPressed: () => appservices.addNewDialog(context),
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
                          color: colors[3],
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
                          color: colors[3],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Text('Background'),
                            IconButton(
                              onPressed: () => appservices.pickColor(
                                context,
                              ),
                              icon: const Icon(
                                Icons.format_color_fill_rounded,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              color: appservices.bgcolor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: colors[3],
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
                          color: colors[3],
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
                                  // appservices.saveImage(capturedImage!);
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
                          )
                        ],
                      ),
                    ),
                  )
                ])
              ]));
    });
  }
}
