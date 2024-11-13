

import '../models/profile_info.dart';
import '../web_services/web_service.dart';

class ProfileRebo {
  final WebService webService;

  ProfileRebo(this.webService);

  Future<Profile_info> getProfileInfo(String token) async {
     return await webService.getProfileInfo(token: token);

  }
}
