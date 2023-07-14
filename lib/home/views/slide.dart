// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:intro_slider/intro_slider.dart';

// class IntroScreenCustomLayout extends StatefulWidget {
//   const IntroScreenCustomLayout({Key? key}) : super(key: key);

//   @override
//   IntroScreenCustomLayoutState createState() => IntroScreenCustomLayoutState();
// }

// // ------------------ Custom layout ------------------
// class IntroScreenCustomLayoutState extends State<IntroScreenCustomLayout> {
//   late Function goToTab;

//   Color primaryColor = const Color(0xffffcc5c);
//   Color secondColor = const Color(0xff3da4ab);

//   void onDonePress() {
//     goToTab(0);
//   }

//   void onTabChangeCompleted(index) {
//     log("onTabChangeCompleted, index: $index");
//   }

//   Widget renderNextBtn() {
//     return Icon(
//       Icons.navigate_next,
//       color: primaryColor,
//       size: 35.0,
//     );
//   }

//   Widget renderDoneBtn() {
//     return Icon(
//       Icons.done,
//       color: primaryColor,
//     );
//   }

//   Widget renderSkipBtn() {
//     return Icon(
//       Icons.skip_next,
//       color: primaryColor,
//     );
//   }

//   ButtonStyle myButtonStyle() {
//     return ButtonStyle(
//       shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
//       backgroundColor:
//           MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
//       overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
//     );
//   }

//   List<Widget> generateListCustomTabs() {
//     return List.generate(
//       3,
//       (index) => Container(
//         color: Colors.black26,
//         width: double.infinity,
//         height: double.infinity,
//         child: ListView(
//           children: <Widget>[
//             const SizedBox(height: 20),
//             Center(
//               child: DropdownButton<String>(
//                 value: index.toString(),
//                 icon: Icon(Icons.arrow_downward, color: secondColor, size: 20),
//                 elevation: 16,
//                 style: TextStyle(color: primaryColor),
//                 underline: Container(
//                   height: 2,
//                   color: secondColor,
//                 ),
//                 onChanged: (String? value) {},
//                 items: ["0", "1", "2"]
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value,
//                         style: TextStyle(color: secondColor, fontSize: 20)),
//                   );
//                 }).toList(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Image.network(
//               "https://picsum.photos/${300 + index}",
//               width: 300.0,
//               height: 300.0,
//             ),
//             const SizedBox(height: 20),
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//               child: Text(
//                 "Title at index $index",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: secondColor,
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'RobotoMono',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IntroSlider(
//       key: UniqueKey(),
//       // Skip button
//       renderSkipBtn: renderSkipBtn(),
//       skipButtonStyle: myButtonStyle(),

//       // Next button
//       renderNextBtn: renderNextBtn(),
//       nextButtonStyle: myButtonStyle(),

//       // Done button
//       renderDoneBtn: renderDoneBtn(),
//       onDonePress: onDonePress,
//       doneButtonStyle: myButtonStyle(),

//       // Indicator
//       indicatorConfig: const IndicatorConfig(
//         colorIndicator: Color(0xffffcc5c),
//         sizeIndicator: 13.0,
//         typeIndicatorAnimation: TypeIndicatorAnimation.sizeTransition,
//       ),

//       // Custom tabs
//       listCustomTabs: generateListCustomTabs(),
//       backgroundColorAllTabs: Colors.white,
//       refFuncGoToTab: (refFunc) {
//         goToTab = refFunc;
//       },

//       // Behavior
//       scrollPhysics: const BouncingScrollPhysics(),
//       onTabChangeCompleted: onTabChangeCompleted,
//     );
//   }
// }

/// ------------------------- start code ----------------------
// import 'package:flutter/material.dart';
// import 'package:intro_slider/intro_slider.dart';

// class IntroScreenDefault extends StatefulWidget {
//   const IntroScreenDefault({Key? key}) : super(key: key);

//   @override
//   IntroScreenDefaultState createState() => IntroScreenDefaultState();
// }

// class IntroScreenDefaultState extends State<IntroScreenDefault> {
//   List<ContentConfig> listContentConfig = [];

//   @override
//   void initState() {
//     super.initState();

//     listContentConfig.add(
//       const ContentConfig(
//         title: "ERASER",
//         description:
//             "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//         pathImage: "assets/images/slider_one.jpeg",
//         heightImage: 370,
//         widthImage: 400,
//         backgroundColor: Color.fromARGB(255, 197, 175, 209),
//       ),
//     );
//     listContentConfig.add(
//       const ContentConfig(
//         title: "PENCIL",
//         description:
//             "Ye indulgence unreserved connection alteration appearance",
//         pathImage: "assets/images/slider_two.jpeg",
//         backgroundColor: Color.fromARGB(255, 197, 175, 209),
//       ),
//     );
//     listContentConfig.add(
//       const ContentConfig(
//         title: "RULER",
//         description:
//             "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//         pathImage: "assets/images/slider_three.jpeg",
//         backgroundColor: Color.fromARGB(255, 197, 175, 209),
//       ),
//     );
//   }

//   void onDonePress() {
//     print("End of slides");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IntroSlider(
//       isAutoScroll: true,
//       key: UniqueKey(),
//       listContentConfig: listContentConfig,
//       onDonePress: onDonePress,
//     );
//   }
// }

/// ---------------------------- end code  ------------------------------------

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gettest/home/controllers/slidercontroller.dart';

// // ignore: must_be_immutable
// class IntroSlider extends GetView<SliderController> {
//   SliderController myslide = Get.put(SliderController());

//   IntroSlider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: myslide.controller,
//               itemCount: myslide.numberOfPages.value,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     EachPage(myslide.messages[index], myslide.images[index]),
//                   ],
//                 );
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Obx(() {
//                 if (1 == myslide.currentPage.value) {
//                   return const Text('');
//                 } else {
//                   return TextButton(
//                       onPressed: () {}, child: const Text("Skip"));
//                 }
//               }),
//               Indicator(
//                 controller: myslide.controller,
//                 pageCount: myslide.numberOfPages.value,
//               ),
//               TextButton(onPressed: () {}, child: const Text("Done")),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class EachPage extends StatelessWidget {
//   final String message;
//   final String image;

//   const EachPage(this.message, this.image, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(40),
//                 bottomRight: Radius.circular(40)),
//             child: Image.asset(
//               image,
//               fit: BoxFit.cover,
//               width: Get.width,
//               height: Get.height * 0.9,
//             ),
//           ),
//           Text(message),
//         ],
//       ),
//     );
//   }
// }

// class Indicator extends AnimatedWidget {
//   final PageController controller;
//   final int pageCount;
//   const Indicator(
//       {super.key, required this.controller, required this.pageCount})
//       : super(listenable: controller);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           ListView.builder(
//               shrinkWrap: true,
//               itemCount: pageCount,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return _createIndicator(index);
//               })
//         ],
//       ),
//     );
//   }

//   Widget _createIndicator(index) {
//     double w = 10;
//     double h = 10;
//     MaterialColor color = Colors.grey;

//     if (controller.page == index) {
//       color = Colors.green;
//       h = 13;
//       w = 13;
//     }

//     return SizedBox(
//       height: 26,
//       width: 26,
//       child: Center(
//         child: AnimatedContainer(
//           margin: const EdgeInsets.all(5),
//           color: color,
//           width: w,
//           height: h,
//           duration: const Duration(microseconds: 1),
//         ),
//       ),
//     );
//   }
// }

/// -------------------------- new code   ----------------------
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gettest/home/controllers/slidercontroller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:gettest/home/views/splashpage.dart';

// ignore: must_be_immutable
class IntroScreenDefault extends GetView<SliderController> {
  final SliderController myslide = Get.put(SliderController());

  IntroScreenDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: myslide.controller,
              itemCount: myslide.listContentConfig.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    EachPage(
                      myslide.listContentConfig[index].title.toString(),
                      myslide.listContentConfig[index].description.toString(),
                      myslide.listContentConfig[index].pathImage.toString(),
                      showSkipButton: myslide.currentPage.value == index,
                      countdownDuration: myslide.countdown.value,
                      controller: myslide.controller,
                      pageCount: myslide.listContentConfig.length,
                    ),
                  ],
                );
              },
              onPageChanged: (int index) {
                myslide.currentPage.value = index;
                myslide.showSkipButton.value =
                    myslide.currentPage.value == index;
                myslide.countdown.value = myslide.countdownDuration.value;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EachPage extends StatelessWidget {
  final String title;
  final String description;
  final String pathImage;
  final bool showSkipButton;
  final int countdownDuration;
  final PageController controller;
  final int pageCount;

  EachPage(
    this.title,
    this.description,
    this.pathImage, {
    Key? key,
    required this.showSkipButton,
    required this.countdownDuration,
    required this.controller,
    required this.pageCount,
  }) : super(key: key);
  final SliderController myslide = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Image.asset(
              pathImage,
              fit: BoxFit.cover,
              width: Get.width,
              height: Get.height,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              // color: Colors.black54,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Indicator(
              controller: controller,
              pageCount: pageCount,
            ),
          ),
          Visibility(
            visible: showSkipButton,
            child: Positioned(
              bottom: 16,
              right: 16,
              child: CountdownTimer(
                endTime: DateTime.now().millisecondsSinceEpoch +
                    countdownDuration * 1000,
                onEnd: () {
                  Get.offAll(SplashPage());
                },
                widgetBuilder: (_, time) {
                  myslide.countdown.value = time?.sec?.toInt() ?? 0;
                  return ElevatedButton(
                    onPressed: () {
                      Get.offAll(SplashPage());
                    },

                    child: time?.sec == null
                        ? const Text(" ")
                        : Text("Skip ${time?.sec.toString()}"),

                    // child: Text("Skip (${time?.sec.toString()})"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class Indicator extends AnimatedWidget {
//   final PageController controller;
//   final int pageCount;

//   const Indicator({Key? key, required this.controller, required this.pageCount})
//       : super(key: key, listenable: controller);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: List.generate(pageCount, (index) => _buildIndicator(index)),
//       ),
//     );
//   }

//   Widget _buildIndicator(int index) {
//     final selected = index == controller.page;
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       width: selected ? 16 : 8,
//       height: 8,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: selected ? Colors.blue : Colors.grey,
//       ),
//     );
//   }
// }

class Indicator extends AnimatedWidget {
  final PageController controller;
  final int pageCount;

  const Indicator({Key? key, required this.controller, required this.pageCount})
      : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    if (!controller.hasClients || !controller.position.hasContentDimensions) {
      return Container(); // Return an empty container if content dimensions are not available yet
    }

    final currentPage = controller.page ?? 0.0;
    final selectedPage = currentPage.round();

    return SizedBox(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            pageCount, (index) => _buildIndicator(index, selectedPage)),
      ),
    );
  }

  Widget _buildIndicator(int index, int selectedPage) {
    final selected = index == selectedPage;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: selected ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: selected ? Colors.white : Colors.grey,
      ),
    );
  }
}
