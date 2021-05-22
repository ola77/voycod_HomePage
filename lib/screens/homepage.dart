import 'package:flutter/material.dart';
import 'package:home_page_ui_task/res/colors.dart';
import 'package:home_page_ui_task/res/image_paths.dart';
import 'package:home_page_ui_task/res/strings.dart';
import 'package:home_page_ui_task/widgets/card.dart';
import 'package:home_page_ui_task/widgets/m_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_page_ui_task/widgets/msize_boxes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  int _current = 0;
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SafeArea(
      child: ListView(children: [
        CarouselSlider(
          items: [
            //1st Image of Slider
            buildBanner(ImagePaths.banner1),

            //2nd Image of Slider
            buildBanner(ImagePaths.banner2)
          ],
          options: CarouselOptions(
            height: 180.0.h,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 900),
            viewportFraction: 0.8,
          ),
        ),
        buildShopCategoryList(),
        MHeight(
          height: 20,
        ),
        buildDealsList()
      ]),
    );
  }

  Widget buildBanner(String image) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCard(String img, String title, {String desc}) {
    return SafeArea(
      child: CardWidget(
        id: "1",
        image: img,
        title: title,
        replyDesc: true,
        desc: desc,
      ),
    );
  }

  Widget buildShopCategoryList() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: MText(
                  text: AppStrings.shop,
                ),
              ),
            ),
            Divider(
              color: AppColors.mainColor,
              thickness: 5,
              indent: 170,
              endIndent: 170,
            ),
            buildCard(ImagePaths.beverages, AppStrings.Beverage),
            buildCard(ImagePaths.biscuits, AppStrings.biscuits),
            buildCard(ImagePaths.breakfast, AppStrings.breakfast),
            buildCard(ImagePaths.grocery, AppStrings.grocery),
            buildCard(ImagePaths.household, AppStrings.household),
            buildCard(ImagePaths.vegetables, AppStrings.vegetables),
          ],
        ),
      ),
    );
  }

  Widget buildDealsList() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: MText(
                  text: AppStrings.deals,
                ),
              ),
            ),
            Divider(
              color: AppColors.mainColor,
              thickness: 5,
              indent: 170,
              endIndent: 170,
            ),
            buildCard(ImagePaths.oreo, AppStrings.oreo,
                desc: AppStrings.oreo_desc),
            buildCard(ImagePaths.oil, AppStrings.Oil,
                desc: AppStrings.Oil_desc),
            buildCard(ImagePaths.apple, AppStrings.apple,
                desc: AppStrings.apple_desc),
            buildCard(ImagePaths.beverages, AppStrings.Beverage_deals,
                desc: AppStrings.Beverage_desc),
          ],
        ),
      ),
    );
  }
}
