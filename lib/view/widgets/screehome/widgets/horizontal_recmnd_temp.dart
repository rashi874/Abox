import 'package:abox/view/widgets/horizontal_view/horizontal_temp.dart';
import 'package:abox/view/widgets/horizontal_view/widget/horizontal_edit.dart';
import 'package:flutter/material.dart';
import 'package:abox/view/widgets/screehome/const.dart';

class HorizontalRecomendedTemplates extends StatelessWidget {
  const HorizontalRecomendedTemplates({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  // color: const Color.fromARGB(255, 253, 191, 154),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  'Horizontal Templates',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Color.fromARGB(255, 12, 12, 12),
                  ),
                ),
              ),
              // IconButton(
              //     icon: const Icon(
              //       Icons.arrow_forward_sharp,
              //       size: 20,
              //     ),
              //     onPressed: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const NewModel(),
              //           ),
              //         )),
            ],
          ),
        ),
        SizedBox(
          height: 105,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HorizontalEditing(
                                    // bgscolor: colors[index],
                                    color: colors[index],
                                    image: homeshot,
                                    appbartitle: text('Iphone 13 pro')[index],
                                    mock: temp[index], radiuses: models[index],
                                  )),
                        )),
                    child: Container(
                      // padding: const EdgeInsets.all(10.0),
                      // height: 150,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: colors[2],
                          width: .5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Positioned(
                                left: 1.7,
                                top: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    homeshot,
                                    height: 69,
                                  ),
                                ),
                              ),
                              Image.asset(
                                temp[index],
                                height: 70,
                              ),
                            ],
                          ),
                          kboxwidth10,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  text('Iphone 13 pro')[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.2,
                                    color: Color.fromARGB(255, 9, 8, 8),
                                  ),
                                ),
                                kbox2,
                                Row(
                                  children: [
                                    const Text(
                                      'Templates',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0),
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
                                    color: Color.fromARGB(255, 112, 112, 112),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
