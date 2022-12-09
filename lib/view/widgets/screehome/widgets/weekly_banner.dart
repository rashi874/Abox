import 'package:flutter/material.dart';
import 'package:abox/view/widgets/screehome/const.dart';

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
          color: const Color.fromARGB(255, 242, 146, 175).withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Weekly Release',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const Text(
                  'New Templates',
                  style: TextStyle(
                    fontSize: 10,
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
                      'Try now Free',
                      style: TextStyle(
                        fontSize: 9,
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
                      radius: 50,
                      backgroundColor: const Color.fromARGB(255, 238, 129, 129)
                          .withOpacity(0.5),
                      child: CircleAvatar(
                        radius: 40,
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
    );
  }
}
