class CreateUserModel {
  String? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? fitnessGoal;
  String? age;
  String? height;
  String? weight;
  String? gender;
  String? createdAt;
  String? updatedAt;
  UserImage? image;

  CreateUserModel({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.fitnessGoal,
    this.age,
    this.height,
    this.weight,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    fitnessGoal = json['fitnessGoal'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? UserImage.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['fitnessGoal'] = fitnessGoal;
    data['age'] = age;
    data['height'] = height;
    data['weight'] = weight;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class UserImage {
  String? id;
  String? image;
  String? userId;
  String? ext;
  String? createdAt;
  String? updatedAt;

  UserImage({
    this.id,
    this.image,
    this.userId,
    this.ext,
    this.createdAt,
    this.updatedAt,
  });

  UserImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    userId = json['user_id'];
    ext = json['ext'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['image'] = image;
    data['user_id'] = userId;
    data['ext'] = ext;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
