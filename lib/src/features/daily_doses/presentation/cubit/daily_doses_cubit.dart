import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'daily_doses_state.dart';

class DailyDosesCubit extends Cubit<DailyDosesState> {
  DailyDosesCubit() : super(DailyDosesInitial());
}
