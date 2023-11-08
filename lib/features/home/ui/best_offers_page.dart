import 'package:flutter/material.dart';
import 'dart:async';

class BestOffers extends StatefulWidget {
  const BestOffers({Key? key}) : super(key: key);

  @override
  _BestOffersState createState() => _BestOffersState();
}

class _BestOffersState extends State<BestOffers> {
  late final PageController pageController;
  int pageNumb = 2;
  late Timer timer;

  void initState() {
    pageController = PageController(
      initialPage: 2,
      viewportFraction: 0.75,
    );

    // Configure un Timer pour changer automatiquement de page toutes les 3 secondes
    timer = Timer.periodic (Duration(seconds: 3), (timer) {
      if (pageNumb < 4) {
        pageNumb++;
        pageController.animateToPage(
          pageNumb,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        pageNumb = 0;
        pageController.jumpToPage(0);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    timer.cancel(); // N'oubliez pas d'annuler le Timer lorsqu'il n'est plus nécessaire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                pageNumb = index;
                setState(() {});
              },
              itemBuilder: ((context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://media.istockphoto.com/id/1257563298/photo/fashion-clothes-on-a-rack-in-a-light-background-indoors-place-for-text.jpg?s=612x612&w=0&k=20&c=UTL3KlMvLkteLe_9l3QbMklBcyaKQM5j6mcDxxtTr4Y=',
                    ),
                  ),
                ),
                height: 200,
                margin:const  EdgeInsets.only(top: 8, left: 18, bottom: 5),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin:const  EdgeInsets.only(top: 70),
                      height: 100,
                      width: 150,
                      child: const Text(
                        "Autumn Collection 2022",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    )
                  ],
                ),
              )),
              itemCount: 5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
                  (index) => Container(
                margin:const  EdgeInsets.all(3),
                height: 6,
                width: pageNumb == index ? 15 : 5,
                decoration: BoxDecoration(
                  color: pageNumb == index ? Colors.blueAccent : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              growable: false,
            ),
          ),
        ],
      ),
    );
  }
}
