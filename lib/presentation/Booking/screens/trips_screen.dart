import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/constants/colors.dart';
import '../../../busieness_logic/BookingCubit/booking_cubit.dart';
import '../../../injection/injection.dart';
import '../widgets/trips_list.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColors.myWhite,
        child: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'My Trip',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: 'Upcoming',
                      ),
                      Tab(
                        text: 'Finished',
                      ),
                      Tab(
                        text: 'Completed',
                      ),
                    ],
                    unselectedLabelColor: MyColors.myGery,
                    indicatorColor: Colors.transparent,
                    labelColor: MyColors.myGreen,
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    Center(
                        child: TripsList(
                          typeOfTrips: 'upcomming',
                        )),
                    Center(
                      child: TripsList(
                        typeOfTrips: 'cancelled',
                      ),
                    ),
                    Center(
                        child: TripsList(
                          typeOfTrips: 'completed',
                        ))
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
