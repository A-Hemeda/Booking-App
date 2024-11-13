import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../Screens/login_screen.dart';
import '../register_Widget.dart';



class BoardingModel {
  String? logoImage;
  String? image;
  String? title;
  String? body;

  BoardingModel({
    this.logoImage,
    required this.image,
    required this.title,
    required this.body
  });


}

class OnBoardingWidget extends StatefulWidget {

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  double _currentPageIndex = 0;

  List<BoardingModel> boarding = [
    BoardingModel(
      logoImage: 'assets/images/logo.png',
      image: 'assets/images/1.jpg',
      title: 'Motel',
      body: 'Best hotel deals for your holiday',
    ),
    BoardingModel(
      logoImage: 'assets/images/logo.png',
      image: 'assets/images/2.png',
      title: 'plan your trips',
      body: 'book one of your unique hotel to escape the ordinary',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => BuildOnboardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index.toDouble();
                  });
                },
              ),
            ),
            DotsIndicator(
              dotsCount: 3,
              position: _currentPageIndex,
              decorator: DotsDecorator(

                activeColor: Colors.teal,
                activeShape: RoundedRectangleBorder(),
                shape: RoundedRectangleBorder(),
              ),
            ),
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: Colors.teal[300],
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: MaterialButton(
                height: 30.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterWidget(),
                    ),
                  );
                }, child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.teal[400]
                  ),
                ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildOnboardingItem(BoardingModel model) => Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              width: 70,
              height: 40,

              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
              ),
              child:MaterialButton(
                height: 30.0,
                color: Colors.grey[300],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterWidget(),
                    ),
                  );
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ),
        ],
      ),
      SizedBox(
        height: 18,
      ),
      Center(
        child: Image(image: AssetImage('${model.logoImage}'),
          width: 300,
          height: 50,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Expanded(child: Image(image: AssetImage('${model.image}'))),
      SizedBox(height: 22,),
      Text(
        '${model.title}',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        '${model.body}',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal
        ),
      ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Text(
      //       '${model.title}',
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //           fontSize: 24,
      //           fontWeight: FontWeight.bold
      //       ),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       '${model.body}',
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //           fontSize: 14,
      //           fontWeight: FontWeight.normal
      //       ),
      //     ),
      //   ],
      // ),

    ],
  );
}
