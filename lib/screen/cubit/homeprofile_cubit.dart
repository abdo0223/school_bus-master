import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homeProfile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
}
