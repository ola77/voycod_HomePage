import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_page_ui_task/res/colors.dart';
import 'package:home_page_ui_task/utilities/routes.dart';

import 'm_text.dart';

class CardWidget extends StatelessWidget {
  String id;
  String image;
  String title;
  String desc;
  final bool replyDesc;

  Size size;

  CardWidget({
    this.replyDesc,
    this.id,
    this.image,
    this.title,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return InkWell(
      //onTap: () =>
      // Navigator.pushNamed(context, ITEM_DETAILS),
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
          child: Card(
            child: Stack(
              children: [
                Material(
                  type: MaterialType.card,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  shadowColor: Colors.blueGrey,
                  child: Column(
                    children: [
                      Hero(
                        tag: id,
                        child: Expanded(
                          child: Image.asset(
                            image ?? '',
                            //height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 16.h),
                        child: MText(
                          text: title,
                        ),
                      ),
                      Visibility(
                        visible: replyDesc == true,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: MText(
                            color: AppColors.textColors,
                            text: desc,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
