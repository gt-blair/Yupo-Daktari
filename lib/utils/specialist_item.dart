import 'package:flutter/material.dart';

class SpecialistItem extends StatelessWidget {
  final String imagePath;
  final String imageName;
  const SpecialistItem({Key? key,
    required this.imagePath,
    required this.imageName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color.fromARGB(95, 179, 173, 173),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            imageName,
            style: TextStyle(
                fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}
