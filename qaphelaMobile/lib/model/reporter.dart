import 'package:qaphelaMobile/model/address.dart';
import 'package:qaphelaMobile/model/socialProfiles.dart';
import 'package:qaphelaMobile/model/user.dart';

import 'contactDetails.dart';

class Reporter {
  User user;
  String userType;
  Null imageurl;
  bool isDispatchUser;
  SocialProfiles socialProfiles;
  ContactDetails contactDetails;
  Address address;

  Reporter(
      {this.user,
      this.userType,
      this.imageurl,
      this.isDispatchUser,
      this.socialProfiles,
      this.contactDetails,
      this.address});

  Reporter.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userType = json['user_type'];
    imageurl = json['imageurl'];
    isDispatchUser = json['is_dispatch_user'];
    socialProfiles = json['social_profiles'] != null
        ? new SocialProfiles.fromJson(json['social_profiles'])
        : null;
    contactDetails = json['contact_details'] != null
        ? new ContactDetails.fromJson(json['contact_details'])
        : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['user_type'] = this.userType;
    data['imageurl'] = this.imageurl;
    data['is_dispatch_user'] = this.isDispatchUser;
    if (this.socialProfiles != null) {
      data['social_profiles'] = this.socialProfiles.toJson();
    }
    if (this.contactDetails != null) {
      data['contact_details'] = this.contactDetails.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}
