import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/switch_example/switch_events.dart';
import 'package:bloc_state_management/bloc/switch_example/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates>{

  SwitchBloc() : super(SwitchStates()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchStates> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchStates> emit){
    emit(state.copyWith(slider: event.slider));
  }

}