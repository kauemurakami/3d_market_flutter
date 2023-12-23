import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';
import 'package:rotation_market_shoes/app/core/theme/colors.dart';
import 'package:rotation_market_shoes/app/core/utils/mocks/list_products_mock.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<ImageProvider> imageList = [];
  bool autoRotate = false;
  int rotationCount = 22; // images
  int swipSensitivity = 2; // range 1 - 5
  bool allowSwipeToRotate = true;

  @override
  void initState() {
    updateImageList(context);
    super.initState();
  }

  List<Widget> buildColorWidget() {
    return generateCategories()
        .map(
          (e) => Container(
            padding: const EdgeInsets.only(
              left: 5.0,
              bottom: 10.0,
              top: 15.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: e.id == 1 ? AppColors.myOrange : Colors.white,
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    12.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  e.image,
                  height: 30.0,
                  width: 30.0,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  void updateImageList(BuildContext context) {
    for (int i = 1; i <= 21; i++) {
      imageList.add(
        AssetImage('assets/s$i.png'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Men\' Shoes',
          style: TextStyle(
            color: AppColors.myOrange,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          Image.asset(
            'assets/ic_search.png',
          ),
          const SizedBox(
            width: 16.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: size.width - 30,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 70.0,
                        ),
                        child: Image.asset('assets/ring.png'),
                      ),
                    ),
                    ImageView360(
                      key: UniqueKey(),
                      imageList: imageList,
                      autoRotate: autoRotate,
                      rotationCount: rotationCount,
                      swipeSensitivity: swipSensitivity,
                      allowSwipeToRotate: allowSwipeToRotate,
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                decoration: const BoxDecoration(
                  color: AppColors.grayBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          text: 'Nike Air Max Pre-Day',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                              text: '5.0',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                              text: '(1125 Review)',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          text:
                              'Men\'s sneakers are made with leather upper features for durability and support, while perforations provide airflow during every shoe wear.',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          text: 'Select Color',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: buildColorWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
