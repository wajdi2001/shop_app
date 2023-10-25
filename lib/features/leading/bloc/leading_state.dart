part of 'leading_bloc.dart';

@immutable
abstract  class LeadingState {
  final int index;

  LeadingState({required this.index});
}

final class LeadingInitial extends LeadingState {
  LeadingInitial({required super.index});
}


