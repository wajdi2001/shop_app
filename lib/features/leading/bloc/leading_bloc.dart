import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'leading_event.dart';
part 'leading_state.dart';

class LeadingBloc extends Bloc<LeadingEvent, LeadingState> {
  LeadingBloc() : super(LeadingInitial(index: 0)) {
    on<LeadingSwitchPage>(leadingSwitchPage);
  }
}

FutureOr<void> leadingSwitchPage(
    LeadingSwitchPage event, Emitter<LeadingState> emit) {
  if (event is LeadingSwitchPage) {
    emit(LeadingInitial(index: event.index));
  }
}
