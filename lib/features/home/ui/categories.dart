import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category extends StatefulWidget {
  const Category({super.key});


  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  
  late final PageController pageController;
  late bool taped =false;
  void initState() {
   
    pageController= PageController(
      initialPage: 2,
      viewportFraction: 0.75,

    );
    super.initState();
  }
 @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  int pageNumb=2;
  
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
    
         Column(
           children: [
             CircleAvatar(
              backgroundColor: Color.fromARGB(255, 223, 218, 218),
              radius: 30,
              child: FaIcon(FontAwesomeIcons.marsAndVenus,color: Colors.black54,size: 30,)
        ),
         SizedBox(height: 3,),
            Text('Men',style: TextStyle(color: Colors.grey,fontSize: 15),)
           ],
         ),
         Column(
           children: [
             CircleAvatar(
              backgroundColor: Color.fromARGB(255, 223, 218, 218),
              radius: 30,
              child: FaIcon(FontAwesomeIcons.headphones,color: Colors.black54,size: 30,),
        ),
         SizedBox(height: 3,),
            Text('Accessories',style: TextStyle(color: Colors.grey,fontSize: 15),)
           ],
         ),
         Column(
           children: [
             CircleAvatar(
              backgroundColor: Color.fromARGB(255, 223, 218, 218),
              radius: 30,
              child: FaIcon(FontAwesomeIcons.hatWizard,color: Colors.black54,size: 30,)
        ),
         SizedBox(height: 3,),
            Text('Beauty',style: TextStyle(color: Colors.grey,fontSize: 15),)
           ],
         ),
  ] );
            
  }
}