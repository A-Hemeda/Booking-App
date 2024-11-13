import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/utils/enum.dart';
import 'package:hotels_booking_app/utils/text_styles.dart';
import 'package:hotels_booking_app/utils/themes.dart';
import 'package:hotels_booking_app/presentation/Filter/widgets/common_button.dart';
//import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
//import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:hotels_booking_app/modules/explore/home_explore_slider_view.dart';

import 'package:hotels_booking_app/presentation/Filter/screens/explore/popular_list_view.dart';

//import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../busieness_logic/FilterCubit/cubit.dart';
import '../../../../busieness_logic/FilterCubit/states.dart';

import '../../../../constants/strings.dart';
import '../../../../data/Filter/models/Filter/Search/hotel.dart';
import '../../../../modules/explore/home_explore_slider_view.dart';
import '../../../Booking/screens/booking_screen.dart';
import '../../widgets/NoHotelsFound.dart';
import '../../widgets/bottom_top_move_animation_view.dart';
import '../../widgets/common_card.dart';
import '../../widgets/common_search_bar.dart';
import '../../widgets/hotelCardItem.dart';
import '../explore/explore_map&all.dart';
import '../explore/explore_screen.dart';
import '../explore/hotel_list_view_page.dart';
import '../explore/title_view.dart';
import '../searchHotels/SearchScreen.dart';

class HomeExploreScreen extends StatefulWidget {
  final AnimationController animationController;

  const HomeExploreScreen({Key? key, required this.animationController})
      : super(key: key);
  @override
  _HomeExploreScreenState createState() => _HomeExploreScreenState();
}

class _HomeExploreScreenState extends State<HomeExploreScreen>
    with TickerProviderStateMixin  {
 // var hotelList = HotelListData.hotelList;
  late ScrollController controller;
  late AnimationController econtroller;
  var sliderImageHieght = 0.0;
  List<Hotel>? allhotels=[];
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FilterCubit>(context).getAllhotels();
    econtroller =
        AnimationController(duration: Duration(milliseconds: 0), vsync: this);

    widget.animationController.forward();
    controller = ScrollController(initialScrollOffset: 50.0);
    controller
      .addListener(() {
        if (mounted) {
          if (controller.offset < 0) {
            // we static set the just below half scrolling values
            econtroller.animateTo(0.0);
          } else if (controller.offset > 0.0 &&
              controller.offset < sliderImageHieght) {
            // we need around half scrolling values
            if (controller.offset < ((sliderImageHieght / 1.5))) {
              econtroller
                  .animateTo((controller.offset / sliderImageHieght));
            } else {
              // we static set the just above half scrolling values "around == 0.64"
              econtroller
                  .animateTo((sliderImageHieght / 1.5) / sliderImageHieght);
            }
          }
        }
      });
    _animation =
        Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: econtroller,
            curve: Curves.easeOut
        ));
  }

  @override
  Widget build(BuildContext context) {
    sliderImageHieght = MediaQuery.of(context).size.width * 1.3;
    return Scaffold(
     // key:UniqueKey(),
      backgroundColor: Colors.white,
      body: BottomTopMoveAnimationView(
        animationController: widget.animationController,
        child: Container(
             // height: 500,
          child: Stack(
               children: <Widget>[
                 Container(
                   color: AppTheme.scaffoldBackgroundColor,
                   child: ListView.builder(
                     controller: controller,
                     itemCount: 1,
                     // padding on top is only for we need spec for sider
                     padding:
                     EdgeInsets.only(top: sliderImageHieght + 32, bottom: 16),
                     scrollDirection: Axis.vertical,
                     itemBuilder: (context, index) {
                       // some list UI
                       var count = 4;
                       var animation = Tween(begin: 0.0, end: 1.0).animate(
                         CurvedAnimation(
                           parent: widget.animationController,
                           curve: Interval((1 / count) * index, 1.0,
                               curve: Curves.fastOutSlowIn),
                         ),
                       );


                         return  BlocBuilder<FilterCubit, Filterstates>(
                             builder: (context, state) {
                               if (BlocProvider
                                   .of<FilterCubit>(context)
                                   .allHotels
                                   .data
                                   ?.hotelsList
                                   ?.isNotEmpty == true) {
                                 allhotels=BlocProvider.of<FilterCubit>(context).allHotels.data ?.hotelsList!;

                                 return ListView.builder(
                                     shrinkWrap: true,
                                     physics: NeverScrollableScrollPhysics(),
                                     padding: EdgeInsets.all(8),
                                     itemCount: BlocProvider.of<FilterCubit>(context)
                                         .allHotels
                                         .data
                                         ?.hotelsList
                                         ?.length,
                                     itemBuilder: (BuildContext cxt, int index) {
                                       return HotelCardItem(
                                         hotel: (BlocProvider.of<FilterCubit>(context)
                                             .allHotels
                                             .data
                                             ?.hotelsList![index])!,
                                       );
                                     });
                               }
                               else return CircularProgressIndicator();
                             }
                         );

                     },
                   ),
                 ),
                 // sliderUI with 3 images are moving
    //
                 _sliderUI(),

                 // viewHotels Button UI for click event
                  _viewHotelsButton(econtroller),

                 //just gradient for see the time and battry Icon on "TopBar"
                 // Positioned(
                 //   top: 0,
                 //   left: 0,
                 //   right: 0,
                 //   child: Container(
                 //     height: 80,
                 //     decoration: BoxDecoration(
                 //         gradient: LinearGradient(
                 //           colors: [
                 //             Theme.of(context).backgroundColor.withOpacity(0.4),
                 //             Theme.of(context).backgroundColor.withOpacity(0.0),
                 //           ],
                 //           begin: Alignment.topCenter,
                 //           end: Alignment.bottomCenter,
                 //         )),
                 //   ),
                 // ),
                 //   serachUI on Top  Positioned
                 Positioned(
                   top: MediaQuery.of(context).padding.top,
                   left: 0,
                   right: 0,
                   child: serachUI(),
                 ),

               ],
             ),
        ),
      ),
    );
  }

  Widget _viewHotelsButton(AnimationController _animationController) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        var opecity = 1.0 -
            (_animationController.value > 0.64
                ? 1.0
                : _animationController.value);
        return Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: sliderImageHieght * (1.0 - _animationController.value),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 32,
                left: null,
                right:
                     null,
                child: Opacity(
                  opacity: opecity,
                  child: CommonButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelHomeScreen()),
                      );
                    },
                    buttonTextWidget: const Padding(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Text(
                        "View Hotel",

                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _sliderUI() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedBuilder(


        animation: econtroller,
        builder: (BuildContext context, Widget? child) {
          // we calculate the opecity between 0.64 to 1.0
          var opecity = 1.0 -
              (econtroller.value > 0.64
                  ? 1.0
                  : econtroller.value);
          return SizedBox(
            height: sliderImageHieght * (1.0 - econtroller.value),
            child: HomeExploreSliderView(
              opValue: opecity,
              click: () {},
            ),
          );
        },
      ),
    );
  }


  Widget getDealListView(int index) {
    var hotelList = allhotels;
    List<Widget> list = [];
    // hotelList.forEach((f) {
    //   var animation = Tween(begin: 0.0, end: 1.0).animate(
    //     CurvedAnimation(
    //       parent: widget.animationController,
    //       curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn),
    //     ),
    //   );
    //   list.add(
    //     HotelListViewPage(
    //       callback: () {
    //         Scaffold();
    //       },
    //       hotelData: null,
    //       animation: animation,
    //       animationController: widget.animationController,
    //     ),
    //   );
    // });
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: list,
      ),
    );
  }

  Widget serachUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: CommonCard(
        radius: 36,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(38)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => searchScreen()),
            );
          },
          child: const CommonSearchBar(
            iconData: FontAwesomeIcons.search,
            enabled: false,
            text: "where_are_you_going",
          ),
        ),
      ),
    );
  }
}