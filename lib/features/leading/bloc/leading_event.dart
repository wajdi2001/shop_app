part of 'leading_bloc.dart';

abstract class LeadingEvent {}

class LeadingSwitchPage extends LeadingEvent {
  final int index;
  LeadingSwitchPage({required this.index});
}
