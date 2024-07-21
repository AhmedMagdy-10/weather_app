abstract class HomeState {}

class InitailState extends HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {}

class ErrorState extends HomeState {
  ErrorState({required this.errorMassage});
  final String errorMassage;
}
