import 'package:abox/view/widgets/screehome/const.dart';
import 'package:flutter/material.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  kbox20,
                  // kbox20,
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 0, 64),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Positioned(
                        left: 70,
                        top: 30,
                        child: Container(
                          width: 100,
                          height: 205,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                                image: AssetImage(homeshot), fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Image.asset(
                        kmodelimg3,
                        height: 250,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Simple & Fast,\nScreenshot - \nTemplate  \nCreater .',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      color: Color.fromARGB(255, 77, 77, 77),
                    ),
                    textAlign: TextAlign.start,
                  ),
                  // kbox10,

                  const Text(
                    "Select from our stunning range\nof inspirational templates modelled \non successful apps across \nthe iOS and Android app stores",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 95, 95, 95)),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.adobe_rounded,
                        color: Color.fromARGB(255, 255, 99, 99),
                      ),
                      kboxwidth5,
                      Text(
                        'Try now Free',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
