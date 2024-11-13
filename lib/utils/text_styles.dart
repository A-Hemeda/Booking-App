import 'package:flutter/material.dart';

import 'package:hotels_booking_app/utils/themes.dart';

class TextStyles {
  final BuildContext context;

  TextStyles(this.context);

  TextStyle getTitleStyle() {
    return Theme.of(context).textTheme.headline6!.copyWith(
      fontSize: 24,
      color: AppTheme.primaryTextColor,
    );
  }

  TextStyle getDescriptionStyle() {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      color: AppTheme.secondaryTextColor,
    );
  }

  TextStyle getRegularStyle() {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: 16,
      color: AppTheme.primaryTextColor,
    );
  }

  TextStyle getBoldStyle() {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontSize: 14,
      color: AppTheme.primaryTextColor,
    );
  }
}