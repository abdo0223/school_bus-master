abstract class SchoolLoginState {}

class SchoolLoginIntialState extends SchoolLoginState {}

class SchoolLoginLoadingState extends SchoolLoginState {}

class SchoolLoginSuccessState extends SchoolLoginState {
  final String uId;

  SchoolLoginSuccessState(this.uId);
}

class SchoolLoginERRORState extends SchoolLoginState {
  final String error;
  SchoolLoginERRORState(this.error);
}

class SchoolChangePasswordVisibiltyState extends SchoolLoginState {}

class SchoolProfileImagePickedSuccessState extends SchoolLoginState {}

class SchoolProfileImagePickedErrorState extends SchoolLoginState {}

class SchoolGetUserSuccessState extends SchoolLoginState {}

class SchoolGetUserLoadingState extends SchoolLoginState {}

class SchoolGetUsererrorState extends SchoolLoginState {
  final String error;
  SchoolGetUsererrorState(this.error);
}

class SchoolUploadProfileImagePickedSuccessState extends SchoolLoginState {}

class SchoolUploadProfileImagePickedErrorState extends SchoolLoginState {}

class SchoolUserUpdateErrorState extends SchoolLoginState {}

class SchoolUserUpdateLoadinState extends SchoolLoginState {}

class SchoolUserUpdateSuccessState extends SchoolLoginState {}
