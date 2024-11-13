import 'package:flutter/material.dart';


import '../../../../utils/text_styles.dart';
import '../../../../utils/themes.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController animationController;
  final Animation<double> animation;
  final VoidCallback click;
  final bool isLeftButton;

  const TitleView(
      {Key? key,
        this.titleTxt: "",
        this.subTxt: "",
        required this.animationController,
        required this.animation,
        required this.click,
        this.isLeftButton: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: <Widget>[
                  Text(
                    titleTxt,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black)
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  isLeftButton
                      ? Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                      BorderRadius.all(Radius.circular(4.0)),
                      onTap: () {
                        return click();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              subTxt,
                              textAlign: TextAlign.left,
                              style: TextStyles(context)
                                  .getBoldStyle()
                                  .copyWith(
                                  fontSize: 16,
                                  color: AppTheme.primaryColor),
                            ),
                            SizedBox(
                              height: 38,
                              width: 26,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 18,
                                color:Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      : SizedBox()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}