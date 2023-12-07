import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String value;

  const InfoWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                const SizedBox(height: 5,),
                Text(value, style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.w500 , color: Colors.grey),),
                Container(color: Colors.green, height: 2,),

              ],
            )
          ],
        ),
        Container(margin: const EdgeInsets.only(top: 12) ,height: 2,width: double.infinity,color: Colors.green,)
      ],
    );
  }
}
