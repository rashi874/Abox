import 'package:flutter/material.dart';
import 'package:abox/const.dart';

class WeeklyBanner extends StatelessWidget {
  const WeeklyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            color: colors[2],
            width: .5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Upcoming Templates',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const Text(
                    'Coming soon',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  kbox2,
                  Row(
                    children: const [
                      Icon(
                        Icons.adobe_rounded,
                        size: 15,
                        color: Colors.red,
                      ),
                      kboxwidth5,
                      Text(
                        'Free',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 7, 7, 7),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor:
                            const Color.fromARGB(255, 238, 129, 129)
                                .withOpacity(0.5),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor:
                              const Color.fromARGB(133, 238, 126, 126)
                                  .withOpacity(0.5),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          homeshot,
                          height: 72,
                        ),
                      ),
                      Image.asset(
                        temp[3],
                        height: 73,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
