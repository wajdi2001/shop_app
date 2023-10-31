part of 'leading_bloc.dart';

@immutable
  class LeadingState {
   final int index;

  LeadingState({  required this.index});
}


final class LeadingInitial extends LeadingState {
  LeadingInitial({ required super.index});
}

final class LeadingOpenCategoryState extends LeadingState {
  final bool open;

  LeadingOpenCategoryState({required this.open, super.index=0, });
}
