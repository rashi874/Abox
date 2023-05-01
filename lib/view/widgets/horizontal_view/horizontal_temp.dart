import 'package:abox/view/widgets/horizontal_view/widget/horizontal_edit.dart';
import 'package:abox/view/widgets/vertical_view/vertical_temp.dart';
import 'package:flutter/material.dart';
import 'package:abox/const.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewModel extends StatelessWidget {
  const NewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: const Text(
      //     'Horizontal Templates',
      //     style: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.bold,
      //       letterSpacing: 0.5,
      //       color: Color.fromARGB(255, 12, 12, 12),
      //     ),
      //   ),
      // ),
      body: ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          // scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HorizontalEditing(
                          title: ktext[index],
                          color: colors[index],
                          image: homeshot,
                          appbartitle: text('Iphone 13 pro')[index],
                          mock: temp[index],
                          radiuses: models[index],
                        ),
                      ),
                    )),
                child: Container(
                  // padding: const EdgeInsets.all(10.0),
                  height: 110,
                  // width: 220,
                  decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: colors[index],
                      width: .5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              text('Iphone 13 pro')[index],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.2,
                                // color: Color.fromARGB(255, 9, 8, 8),
                              ),
                            ),
                            kbox2,
                            Row(
                              children: [
                                const Text(
                                  'Templates',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    // color: Color.fromARGB(255, 68, 68, 68),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                kboxwidth5,
                                Icon(
                                  Icons.fiber_smart_record,
                                  size: 14,
                                  color: colors[index],
                                ),
                              ],
                            ),
                            kbox2,
                            const Text(
                              'Try now Free',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                // color: Color.fromARGB(255, 112, 112, 112),
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      kboxwidth10,
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: models[index],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  left: 1.7,
                                  top: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Image.asset(
                                      homeshot,
                                      height: 69,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  temp[index],
                                  height: 71,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return ((index + 1) % 3 == 0)
                ? const InlineAd()
                : Container(
                    height: 1,
                  );
          }),
    );
  }
}
