import 'package:qaphelaMobile/model/contactDetails.dart';
import 'package:qaphelaMobile/model/pick-up-address.dart';
import 'package:qaphelaMobile/model/user.dart';
import 'package:intl/intl.dart';
class FetchMe {
  List<User> responders;
  PickupAddress pickupAddress;
  ContactDetails contactDetails;
  String incidentType;
  String incidentStatus;
  DateTime pickupTime;
  String victimFullNames;

  FetchMe(
      {this.responders,
      this.pickupAddress,
      this.contactDetails,
      this.incidentType,
      this.incidentStatus,
      this.pickupTime,
      this.victimFullNames});

  FetchMe.fromJson(Map<String, dynamic> json) {
    DateFormat format = DateFormat("yyyy-MM-dd HH:mm");
    if (json['responders'] != null) {
      responders = new List<User>();
      json['responders'].forEach((v) {
        responders.add(new User.fromJson(v));
      });
    }
    pickupAddress = json['pickup_address'] != null
        ? new PickupAddress.fromJson(json['pickup_address'])
        : null;
    contactDetails = json['contact_details'] != null
        ? new ContactDetails.fromJson(json['contact_details'])
        : null;
    incidentType = json['incident_type'];
    incidentStatus = json['incident_status'];
    pickupTime = format.parse(json['pickup_time']);
    victimFullNames = json['victim_full_names'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responders != null) {
      data['responders'] = this.responders.map((v) => v.toJson()).toList();
    }
    if (this.pickupAddress != null) {
      data['pickup_address'] = this.pickupAddress.toJson();
    }
    if (this.contactDetails != null) {
      data['contact_details'] = this.contactDetails.toJson();
    }
    data['incident_type'] = this.incidentType;
    data['incident_status'] = this.incidentStatus;
    data['pickup_time'] = this.pickupTime;
    data['victim_full_names'] = this.victimFullNames;
    return data;
  }

  
}
