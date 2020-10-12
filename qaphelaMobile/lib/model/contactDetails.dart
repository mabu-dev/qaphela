class ContactDetails {
  int id;
  String primaryContactNumber;
  Null secondaryContactNumber;
  Null nextOfKinFirstname;
  Null nextOfKinLastname;
  Null nextOfKinPrimaryContactNumber;
  Null nextOfKinSecondaryContactNumber;

  ContactDetails(
      {this.id,
      this.primaryContactNumber,
      this.secondaryContactNumber,
      this.nextOfKinFirstname,
      this.nextOfKinLastname,
      this.nextOfKinPrimaryContactNumber,
      this.nextOfKinSecondaryContactNumber});

  ContactDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryContactNumber = json['primary_contact_number'];
    secondaryContactNumber = json['secondary_contact_number'];
    nextOfKinFirstname = json['next_of_kin_firstname'];
    nextOfKinLastname = json['next_of_kin_lastname'];
    nextOfKinPrimaryContactNumber = json['next_of_kin_primary_contact_number'];
    nextOfKinSecondaryContactNumber =
        json['next_of_kin_secondary_contact_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['primary_contact_number'] = this.primaryContactNumber;
    data['secondary_contact_number'] = this.secondaryContactNumber;
    data['next_of_kin_firstname'] = this.nextOfKinFirstname;
    data['next_of_kin_lastname'] = this.nextOfKinLastname;
    data['next_of_kin_primary_contact_number'] =
        this.nextOfKinPrimaryContactNumber;
    data['next_of_kin_secondary_contact_number'] =
        this.nextOfKinSecondaryContactNumber;
    return data;
  }
}