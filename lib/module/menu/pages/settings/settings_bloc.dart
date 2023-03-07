import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/core/theme/theme.dart';

part 'settings_event.dart';
part 'settings_state.dart';


@Injectable()
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(const SettingsState(fontSize: 20, theme: AppTheme.light)) {
    on<ThemeChanged>((event, emit) {
      emit(state.copyWith(theme: event.theme));
    });
    on<FontSizeChanged>((event, emit) {
      emit(state.copyWith(fontSize: event.fontSize));
    });
  }
}
