abstract class SchoolState {}

class SchoolInitialState extends SchoolState {}

class SchoolLoadingState extends SchoolState {}

class SchoolGetUserSuccessState extends SchoolState {}

class SchoolGetUserErrorState extends SchoolState {
  final String error;

  SchoolGetUserErrorState(this.error);
}

class SchoolChangeBottomNavState extends SchoolState {}

class SchoolNewPostState extends SchoolState {}

class SchoolProfilePickedSuccessState extends SchoolState {}

class SchoolProfilePickedErrorState extends SchoolState {}

class SchoolCoverPickedSuccessState extends SchoolState {}

class SchoolCoverPickedErrorState extends SchoolState {}

class SchoolUploadProfileSuccessState extends SchoolState {}

class SchoolUploadProfileErrorState extends SchoolState {}

class SchoolUploadCoverSuccessState extends SchoolState {}

class SchoolUploadCoverErrorState extends SchoolState {}

class SchoolUpdateLoadingState extends SchoolState {}

class SchoolUpdateSuccessState extends SchoolState {}

class SchoolUpdateErrorState extends SchoolState {}

//Post
class SchoolCreatePostLoadingState extends SchoolState {}

class SchoolCreatePostSuccessState extends SchoolState {}

class SchoolCreatePostErrorState extends SchoolState {}

class SchoolPostImagePickedSuccessState extends SchoolState {}

class SchoolPostImagePickedErrorState extends SchoolState {}

class SchoolRemovePickedState extends SchoolState {}

class SchoolGetPostsLoadingState extends SchoolState {}

class SchoolGetPostsSuccessState extends SchoolState {}

class SchoolGetPostsErrorState extends SchoolState {
  final String error;

  SchoolGetPostsErrorState(this.error);
}

class SchoolLikePostsSuccessState extends SchoolState {}

class SchoolLikePostsErrorState extends SchoolState {
  final String error;

  SchoolLikePostsErrorState(this.error);
}

class SchoolWriteCommentSuccessState extends SchoolState {}

class SchoolWriteCommentErrorState extends SchoolState {
  final String error;

  SchoolWriteCommentErrorState(this.error);
}

class SchoolGetCommentsPostsSuccessState extends SchoolState {}

class SchoolGetLengthCommentsPostsSuccessState extends SchoolState {}

class SchoolDisLikePostsSuccessState extends SchoolState {}

class SchoolDisLikePostsErrorState extends SchoolState {
  final String error;

  SchoolDisLikePostsErrorState(this.error);
}

class SchoolGetLikePostsSuccessState extends SchoolState {}

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
