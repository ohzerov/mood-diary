import 'package:bloc/bloc.dart';

class ValidationState {
  final double slider1Value;
  final double slider2Value;
  final String textFieldValue;
  final List<int> listOfMoods;

  ValidationState({
    this.slider1Value = 0.0,
    this.slider2Value = 0.0,
    this.textFieldValue = '',
    List<int>? listOfMoods,
  }) : listOfMoods = listOfMoods ?? [];

  bool get isValid =>
      slider1Value != 0 &&
      slider2Value != 0 &&
      textFieldValue.isNotEmpty &&
      listOfMoods.isNotEmpty;

  ValidationState copyWith({
    double? slider1Value,
    double? slider2Value,
    String? textFieldValue,
    List<int>? listOfMoods,
  }) {
    return ValidationState(
        slider1Value: slider1Value ?? this.slider1Value,
        slider2Value: slider2Value ?? this.slider2Value,
        textFieldValue: textFieldValue ?? this.textFieldValue,
        listOfMoods: listOfMoods ?? this.listOfMoods);
  }
}

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationState());

  void updateSlider1(double value) {
    emit(state.copyWith(slider1Value: value));
  }

  void updateSlider2(double value) {
    emit(state.copyWith(slider2Value: value));
  }

  void updateTextField(String value) {
    emit(state.copyWith(textFieldValue: value));
  }

  void updateIntegerList(List<int> newList) {
    emit(state.copyWith(listOfMoods: newList));
  }
}
