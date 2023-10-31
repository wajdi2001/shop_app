import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class CategoriesWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  VoidCallback onTap;
  final String label;
  CategoriesWidget({super.key,
    required this.onTap,required this.label,required this.color,required this.icon}
    );
  

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            GestureDetector(
              onTap: onTap,
              
              child: CircleAvatar(
                
                backgroundColor:Colors.blueGrey,
                radius: 30,
                child: FaIcon(icon,color: color,size: 30),
              ),
            ),
            SizedBox(height: 3,),
            Text(label,style: TextStyle(color: Colors.grey[50], fontSize: 15),)
          ],
        );
  }
}
