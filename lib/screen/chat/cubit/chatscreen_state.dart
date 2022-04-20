abstract class SchoolState {}

class SchoolInitialState extends SchoolState {}

class SchoolLoadingState extends SchoolState {}

class SchoolGetUserSuccessState extends SchoolState {}

class SchoolGetUserErrorState extends SchoolState {
  final String error;

  SchoolGetUserErrorState(this.error);
}

//users-Chats

class SchoolGetUsersLoadingState extends SchoolState {}

class SchoolGetUsersSuccessState extends SchoolState {}

class SchoolGetUsersErrorState extends SchoolState {}

class SchoolSendMessageSuccessState extends SchoolState {}

class SchoolSendMessageErrorState extends SchoolState {}

class SchoolGetMessagesSuccessState extends SchoolState {}

class SchoolSignOutLoadingState extends SchoolState {}

class SchoolSignOutSuccessState extends SchoolState {}

class SchoolSignOutErrorState extends SchoolState {}

class ChangerLoading extends SchoolState {}

class ChangerSuccessfully extends SchoolState {}

////////////////////////////////////////////////////////////////////////register
//register
class SchoolRegisterIntialState extends SchoolState {}

class SchoolRegisterLoadingState extends SchoolState {}

class SchoolRegisterSuccessState extends SchoolState {}

class SchoolRegisterERRORState extends SchoolState {
  final String error;
  SchoolRegisterERRORState(this.error);
}

class SchoolCreateLoadingState extends SchoolState {}

class SchoolCreateSuccessState extends SchoolState {}

class SchoolCreateERRORState extends SchoolState {
  final String error;
  SchoolCreateERRORState(this.error);
}

class SchoolRegisterChangePasswordVisibiltyState extends SchoolState {}

//////////////////////////////////
class SchoolGetUseerLoadingState extends SchoolState {}

class SchoolGetUseerSuccessState extends SchoolState {}

class SchoolGetUseererrorState extends SchoolState {
  final String error;
  SchoolGetUseererrorState(this.error);
}
