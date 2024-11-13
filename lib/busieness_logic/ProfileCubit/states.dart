

import '../../data/profile/models/Update_info.dart';
import '../../data/profile/models/profile_info.dart';

abstract class ProfileState{}

class ProfileInitial extends ProfileState{}

class ProfileInfoLoaded extends ProfileState{
 final Profile_info profile_info;

  ProfileInfoLoaded(this.profile_info);


}
class PickImageSuccessState extends ProfileState{}

class ProfileUpdate extends ProfileState{
  final Update_response update_response;

  ProfileUpdate(this.update_response);


}


