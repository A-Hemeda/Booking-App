
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:hotels_booking_app/busieness_logic/ProfileCubit/states.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/profile/models/profile_info.dart';
import '../../data/profile/rebo/profile_rebo.dart';
import '../../data/profile/rebo/update_rebo.dart';

import '../../../data/Auth/models/login_model.dart';
import '../../../data/Auth/models/login_model.dart';
class ProfileCubit extends Cubit<ProfileState> {
  late final ProfileRebo profileRebo;
  final UpdateRebo updateRebo;
  late ImagePicker picker = ImagePicker();
  XFile? image;

  Profile_info? profile_info;

  ProfileCubit(this.profileRebo, this.updateRebo) : super(ProfileInitial());


  void updateprofileinfo(String token, String name, String email, XFile image) {
    updateRebo.getUpdateresponse(token, name, email, image).then((value) {
      getprofileinfo(token);
      emit(ProfileUpdate(value));
    });
  }

  Profile_info? getprofileinfo(String token) {
    profileRebo.getProfileInfo(token).then((profile) {
   print("profileeeeeeeeeeee ${profile.data?.image}");
      this.profile_info =  profile;
      emit(ProfileInfoLoaded(profile));
      return profile_info;
    });
   return profile_info;
  }



  void pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = pickedFile;

      emit(PickImageSuccessState());
    }
    emit(PickImageSuccessState());
  }
}