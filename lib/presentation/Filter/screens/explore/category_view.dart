import 'package:flutter/material.dart';
//import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';


import '../../../../utils/text_styles.dart';
import '../../../../utils/themes.dart';

class CategoryView extends StatelessWidget {
  final VoidCallback callback;
 // final HotelListData popularList;
  final AnimationController animationController;
  final Animation<double> animation;

  const CategoryView(
      {Key? key,
        //required this.popularList,
        required this.animationController,
        required this.animation,
        required this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: child,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, bottom: 24, top: 16, right: 8),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 2,
                  child: Image.asset(
                    "",
                    //popularList.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.secondaryTextColor.withOpacity(0.4),
                                AppTheme.secondaryTextColor.withOpacity(0.0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, bottom: 32, top: 8, right: 8),
                            child: Text(
                             // popularList.titleTxt
                             "" ,
                              style:
                              TextStyles(context).getBoldStyle().copyWith(
                                fontSize: 24,
                                color: AppTheme.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}