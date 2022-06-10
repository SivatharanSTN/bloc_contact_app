class ContactModel {
  String? createdDate;
  String? name;
  String? avatar;
  String? phone;
  String? streetAddress;
  String? city;
  String? zip;
  String? country;
  String? job;
  String? email;
  String? description;
  String? homeNumber;
  String? socialId;
  String? id;

  ContactModel({
    this.createdDate,
    this.name,
    this.avatar,
    this.phone,
    this.streetAddress,
    this.city,
    this.zip,
    this.country,
    this.job,
    this.email,
    this.description,
    this.homeNumber,
    this.socialId,
    this.id,
  });
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      createdDate: json["createdAt"] ?? "",
      name: json["name"] ?? "",
      avatar: json["avatar"] ?? "",
      phone: json["phone"] ?? "",
      streetAddress: json["street_address"] ?? "",
      city: json["city"] ?? "",
      zip: json["zip"] ?? "",
      country: json["country"] ?? "",
      job: json["job"] ?? "",
      email: json["email"] ?? "",
      description: json["description"] ?? "",
      homeNumber: json["home_number"] ?? "",
      socialId: json["social_id"] ?? "",
      id: json["id"] ?? "",
    );
  }
}
