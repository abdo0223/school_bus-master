import 'dart:io';

class SchoolUserModel {
  bool isUpdated;

  String name;
  String email;
  String phone;
  String uid;
  String profileImage;
  String childName;
  String chlildAddress;
  String schoolName;
  String schoollocation;

  SchoolUserModel({
    this.isUpdated,
    this.email,
    this.name,
    this.phone,
    this.uid,
    this.profileImage,
    this.childName,
    this.chlildAddress,
    this.schoolName,
    this.schoollocation,
  });
  SchoolUserModel.fromjson(Map<String, dynamic> json) {
    email = json['email'];
    if (!isUpdated) {
      name = json['name'];
    }
    phone = json['phone'];
    uid = json['uid'];

    profileImage = json['profileImage'];
    childName = json['childName'];
    chlildAddress = json['chlildAddress'];
    schoolName = json['schoolName'];
    schoollocation = json['schoollocation'];
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "uid": uid,
      "profileImage": profileImage,
      "childName": childName,
      "chlildAddress": chlildAddress,
      "schoolName": schoolName,
      "schoollocation": schoollocation,
    };
  }
}

class SchoolProfileModel {
  String phone;
  String uid;
  String image;
  String childName;
  String chlildAddress;
  String schoolName;
  String schoollocation;

  SchoolProfileModel({
    this.phone,
    this.image,
    this.childName,
    this.chlildAddress,
    this.schoolName,
    this.schoollocation,
    this.uid,
  });
  SchoolProfileModel.fromjson(Map<String, dynamic> json) {
    phone = json['phone'];
    uid = json['uid'];

    image = json['image'];
    childName = json['childName'];
    chlildAddress = json['chlildAddress'];
    schoolName = json['schoolName'];
    schoollocation = json['schoollocation'];
  }
  Map<String, dynamic> toMap() {
    return {
      "phone": phone,
      "image": image,
      "childName": childName,
      "chlildAddress": chlildAddress,
      "schoolName": schoolName,
      "schoollocation": schoollocation,
      "uid": uid,
    };
  }
}

class SocialChatModel {
  String senderId, receiverId, dateTime, text, receiverToken, image;

  SocialChatModel(
      {this.dateTime,
      this.text,
      this.receiverId,
      this.senderId,
      this.receiverToken,
      this.image});

  SocialChatModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    receiverToken = json['receiverToken'];
    dateTime = json['dateTime'];
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'dateTime': dateTime,
      'receiverToken': receiverToken,
      'image': image
    };
  }
}

class SocialUserModel {
  String name, email, phone, uId, image, bio, cover;
  bool isEmailVerified;
  SocialUserModel(
      {this.uId,
      this.email,
      this.phone,
      this.name,
      this.isEmailVerified,
      this.image,
      this.bio,
      this.cover});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    uId = json['uId'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'image': image,
      'cover': cover,
      'bio': bio,
    };
  }
}
