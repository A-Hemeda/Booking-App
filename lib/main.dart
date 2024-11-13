import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/Auth/login_cubit/cubit.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';
import 'package:hotels_booking_app/constants/strings.dart';
import 'package:hotels_booking_app/data/Auth/web_services/dio_helper.dart';
import 'package:hotels_booking_app/presentation/Auth/Widgets/onBoarding/onBoarding_widget.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/Filteration/FilterationScreen.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/explore/explore_map&all.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/explore/explore_screen.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/home/home_explore_screen.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/map/map_screen.dart';
import 'package:hotels_booking_app/constants/strings.dart';

import 'package:hotels_booking_app/presentation/Filter/screens/searchHotels/SearchScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'app_router.dart';
import 'busieness_logic/Auth/register_cubit/cubit.dart';
import 'busieness_logic/BookingCubit/booking_cubit.dart';
import 'busieness_logic/FilterCubit/cubit.dart';
import 'busieness_logic/ProfileCubit/cubit.dart';
import 'data/profile/rebo/profile_rebo.dart';
import 'data/profile/rebo/update_rebo.dart';
import 'injection/injection.dart';

void main() {
  //SharedPreferences.setMockInitialValues({});
  // WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  initGetIt2();
  initBookingGetIt();
  runApp( MyApp(approuter: AppRouter()));
}

class MyApp extends StatefulWidget {
  final AppRouter approuter;
   MyApp({Key? key, required this.approuter}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DioHelper.init();
    econtroller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 5),

    );
  }

  @override
  Widget build(BuildContext context) {
    FilterCubit.getpref();
    LoginCubit.getpref();
    return MultiBlocProvider(

        providers:[
          BlocProvider(
              create:(context)=>getIt<FilterCubit>()..emitGetAllFacilities()
                ..getAllhotels()

          ),
          BlocProvider(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => ProfileCubit(getIt<ProfileRebo>(),getIt<UpdateRebo>()),
          ),
          BlocProvider(
              create:(context)=>getIt<BookingCubit>()
          ),

        ],
        child: BlocBuilder<FilterCubit,Filterstates>(

            builder: (context,state)

            {return MaterialApp(
             // onGenerateRoute:  widget.approuter.generateRoute,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(

                primarySwatch: Colors.blue,
              ),
            home:
            OnBoardingWidget(),
            // HomeExploreScreen( animationController: econtroller,),
              // MapScreen(),
              // HotelHomeScreen()

            );

            }
        )
    );

  }
}

// BlocProvider(
// create:(context)=>getIt<FilterCubit>() ,
// child: FilterationScreen()
// ));
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hotels_booking_app/busieness_logic/BookingCubit/booking_cubit.dart';
// import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';
// import 'package:hotels_booking_app/data/Auth/web_services/dio_helper.dart';
// import 'package:hotels_booking_app/presentation/Auth/Widgets/onBoarding/onBoarding_widget.dart';
// import 'busieness_logic/Auth/bloc_observer.dart';
// import 'busieness_logic/Auth/register_cubit/cubit.dart';
// import 'busieness_logic/FilterCubit/cubit.dart';
// import 'busieness_logic/ProfileCubit/cubit.dart';
// import 'constants/strings.dart';
// import 'data/profile/rebo/profile_rebo.dart';
// import 'data/profile/rebo/update_rebo.dart';
// import 'injection/injection.dart';
//
// void main() {
//   //SharedPreferences.setMockInitialValues({});
//   WidgetsFlutterBinding.ensureInitialized();
//   initGetIt();
//   initGetIt2();
//   Bloc.observer = MyBlocObserver();
//   DioHelper.init();
//   //CacheHelper.init();
//   //WidgetsFlutterBinding.ensureInitialized(); //
// }
//
// class MyApp extends StatefulWidget {
//
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller = AnimationController(
//       vsync: this, // the SingleTickerProviderStateMixin
//       duration: Duration(seconds:3),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     FilterCubit.getpref();
//     return MultiBlocProvider(
//
//         providers:[
//           BlocProvider(
//               create:(context)=>getIt<FilterCubit>()..emitGetAllFacilities()
//                 ..getAllhotels()
//
//           ),
//           BlocProvider(
//             create: (BuildContext context) => RegisterCubit(),
//           ),
//           BlocProvider(
//             create: (BuildContext context) => ProfileCubit(getIt<ProfileRebo>(),getIt<UpdateRebo>()),
//           ),
//           BlocProvider(
//               create:(context)=>getIt<BookingCubit>()
//           ),
//         ],
//         child: BlocBuilder<FilterCubit,Filterstates>(
//
//             builder: (context,state)
//
//             {return MaterialApp(
//                 debugShowCheckedModeBanner: false,
//                 title: 'Flutter Demo',
//                 theme: ThemeData(
//
//                   primarySwatch: Colors.blue,
//                 ),
//                 home: OnBoardingWidget(),
//
//               // HomeExploreScreen( animationController: this.controller,),
//               // MapScreen(),
//               //HotelHomeScreen()
//
//             );
//
//             }
//         )
//     );
//
//   }
// }
//
// // BlocProvider(
// // create:(context)=>getIt<FilterCubit>() ,
// // child: FilterationScreen()
// // ));