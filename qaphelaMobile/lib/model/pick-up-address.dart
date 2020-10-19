class PickupAddress {
  String address;
  String city;
  String country;
  String lattitude;
  String longitude;
  String postalCode;
  String province;
  String streetName;
  String streetNumber;
  String suburb;

  PickupAddress(
      {this.address,
      this.city,
      this.country,
      this.lattitude,
      this.longitude,
      this.postalCode,
      this.province,
      this.streetName,
      this.streetNumber,
      this.suburb});

  PickupAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    country = json['country'];
    lattitude = json['lattitude'];
    longitude = json['longitude'];
    postalCode = json['postal_code'];
    province = json['province'];
    streetName = json['street_name'];
    streetNumber = json['street_number'];
    suburb = json['suburb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['lattitude'] = this.lattitude;
    data['longitude'] = this.longitude;
    data['postal_code'] = this.postalCode;
    data['province'] = this.province;
    data['street_name'] = this.streetName;
    data['street_number'] = this.streetNumber;
    data['suburb'] = this.suburb;
    return data;
  }


  
}