import 'package:flutter/material.dart';

class BestOffers extends StatefulWidget {
  const BestOffers({super.key});

  @override
  State<BestOffers> createState() => _BestOffersState();
}

class _BestOffersState extends State<BestOffers> {
  late final PageController pageController;
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
    return SafeArea(
      child:
       Column(
        children: 
      [
        SizedBox(
                          height: 200,
                          child: PageView.builder(
                            controller: pageController,
                            onPageChanged: (index)
                            {
                              pageNumb=index;
                              setState(() {
                                
                              });
                            },
                              itemBuilder: ((context, index) => AnimatedBuilder(
                                    animation:Listenable.merge([AlwaysStoppedAnimation(120)]),
                                    builder: (context, child) => child!,
                                    child: Container(
                                      
                                      decoration:
                                          BoxDecoration(borderRadius: BorderRadius.circular(30),image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1257563298/photo/fashion-clothes-on-a-rack-in-a-light-background-indoors-place-for-text.jpg?s=612x612&w=0&k=20&c=UTL3KlMvLkteLe_9l3QbMklBcyaKQM5j6mcDxxtTr4Y='))),
                                          height: 200,
                                          
                                          margin: EdgeInsets.only(top: 8,left: 10,bottom: 5),
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: 70,),
                                                height: 100,
                                                width: 150,
                                                child: const Text("Autumn Collection 2022",
                                                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blueGrey,),),
                                              )
                                            ],
                                          ),
                                    ),
                                  )),itemCount: 5,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              5,
                              (index) => Container(
                                margin: EdgeInsets.all(3),
                                height: 6,
                                width: pageNumb==index? 15:5,
                                decoration: BoxDecoration(color: pageNumb==index? Colors.blueAccent:Colors.grey,borderRadius: BorderRadius.circular(10)),
                                
                              ),
                              growable: false),
                        ),
      ],),
    );
  }
}