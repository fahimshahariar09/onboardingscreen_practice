import 'package:flutter/material.dart';
import 'package:onboardingscreen_practice/screen/screen1.dart';
import 'package:onboardingscreen_practice/screen/screen2.dart';
import 'package:onboardingscreen_practice/screen/screen3.dart';
import 'package:onboardingscreen_practice/screen/screen4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController();
  String buttomText="Skip";
  int currentPageindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (index){
            currentPageindex=index;
            if(index==3){
              buttomText="Done";
            }else{
              buttomText="Skib";
            }
            setState(() {

            });
          },
          children: const [
            Screen1(),
            Screen2(),
            Screen3(),
            Screen4(),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){

                },
                child: Text(buttomText),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 4,
                effect: const WormEffect(),
              ),
             currentPageindex==3 ? const SizedBox(width: 10,): GestureDetector(
                onTap: (){
                  PageController(
                    initialPage: 10,
                    
                  );
                },
                child: const Text('next'),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
