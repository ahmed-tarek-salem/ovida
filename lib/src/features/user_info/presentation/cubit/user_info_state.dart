part of 'user_info_cubit.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoInitial extends UserInfoState {
  final int currentIndex;

  const UserInfoInitial({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

class UserInfoUpdated extends UserInfoState {
  final int currentIndex;

  const UserInfoUpdated({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}
