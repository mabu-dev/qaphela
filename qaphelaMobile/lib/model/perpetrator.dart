import 'package:qaphelaMobile/model/socialProfiles.dart';

import 'contactDetails.dart';

class Perpetrators {
  String fullNames;
  String imageurl;
  String workplaceDetails;
  ContactDetails contactDetails;
  SocialProfiles socialProfiles;

  Perpetrators(
      {this.fullNames,
      this.imageurl,
      this.workplaceDetails,
      this.contactDetails,
      this.socialProfiles});

  Perpetrators.fromJson(Map<String, dynamic> json) {
    fullNames = json['full_names'];
    imageurl = json['imageurl'];
    workplaceDetails = json['workplace_details'];
    contactDetails = json['contact_details'] != null
        ? new ContactDetails.fromJson(json['contact_details'])
        : null;
    socialProfiles = json['social_profiles'] != null
        ? new SocialProfiles.fromJson(json['social_profiles'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_names'] = this.fullNames;
    data['imageurl'] = this.imageurl;
    data['workplace_details'] = this.workplaceDetails;
    if (this.contactDetails != null) {
      data['contact_details'] = this.contactDetails.toJson();
    }
    if (this.socialProfiles != null) {
      data['social_profiles'] = this.socialProfiles.toJson();
    }
    return data;
  }
}