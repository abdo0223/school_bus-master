abstract class SchoolRegisterState {}

class SchoolRegisterIntialState extends SchoolRegisterState {}

class SchoolRegisterLoadingState extends SchoolRegisterState {}

class SchoolRegisterSuccessState extends SchoolRegisterState {}

class SchoolRegisterERRORState extends SchoolRegisterState {
  final String error;
  SchoolRegisterERRORState(this.error);
}

class SchoolCreateLoadingState extends SchoolRegisterState {}

class SchoolCreateSuccessState extends SchoolRegisterState {}

class SchoolCreateERRORState extends SchoolRegisterState {
  final String error;
  SchoolCreateERRORState(this.error);
}

class SchoolRegisterChangePasswordVisibiltyState extends SchoolRegisterState {}

//////////////////////////////////
class SchoolGetUseerLoadingState extends SchoolRegisterState {}

class SchoolGetUseerSuccessState extends SchoolRegisterState {}

class SchoolGetUseererrorState extends SchoolRegisterState {
  final String error;
  SchoolGetUseererrorState(this.error);
}
