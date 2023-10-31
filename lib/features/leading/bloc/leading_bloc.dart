import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'leading_event.dart';
part 'leading_state.dart';

class LeadingBloc extends Bloc<LeadingEvent, LeadingState> {
  bool open;
  LeadingBloc({required this.open}) : super(LeadingInitial(index: 0)) {
    on<LeadingSwitchPage>(leadingSwitchPage);
    on<LeadingOpenCategory>(leadingOpenCategory);
  }
  

  FutureOr<void> leadingOpenCategory(LeadingOpenCategory event, Emitter<LeadingState> emit) {
    if (event is LeadingOpenCategory) {
      open=!open;
      emit(LeadingOpenCategoryState(open: open,));
      emit(LeadingInitial(index: 0));
    }
  }
}

FutureOr<void> leadingSwitchPage(
    LeadingSwitchPage event, Emitter<LeadingState> emit) {
  if (event is LeadingSwitchPage) {
    emit(LeadingInitial(index: event.index));
  }
}
