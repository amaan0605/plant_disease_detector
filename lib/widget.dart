import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    required this.headingText,
    required this.subText,
    required this.icon,
  });

  final String headingText;
  final String subText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 100,
          color: Colors.green.shade300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headingText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subText,
                    style: TextStyle(
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
