import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int selectedPageIndex;

  const HomeState({required this.selectedPageIndex});

  factory HomeState.initial() {
    return const HomeState(selectedPageIndex: 0);
  }

  HomeState copyWith({int? selectedPageIndex}) {
    return HomeState(
      selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
    );
  }

  @override
  List<Object> get props => [selectedPageIndex];
}
