import 'package:abox/view/widgets/horizontal_view/widget/horizontal_edit.dart';
import 'package:flutter/material.dart';
import 'package:abox/const.dart';

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
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  'Horizontal Templates',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 105,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(5),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HorizontalEditing(
                                    color: colors[index],
                                    image: homeshot,
                                    appbartitle: text('Iphone 13 pro')[index],
                                    mock: temp[index], radiuses: models[index],
                                  )),
                        )),
                    child: Container(
                      width: 220,
                      decoration: BoxDecoration(
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
