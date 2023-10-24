import 'dart:math';

import 'package:bmi_calculator/cubit/bmi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICubit extends Cubit<BMIStates> {
  BMICubit() : super(InitialState());

  double weight = 0;
  double height = 0;
  double bmi = 0.0;
  String type = "";

  void addWeight() {
    weight++;
    emit(UpdateWeight());
  }

  void removeWeight() {
    weight--;
    emit(UpdateWeight());
  }

  void resetWeight() {
    weight = 0;
    emit(UpdateWeight());
  }

  void addHeight() {
    height++;
    emit(UpdateHeight());
  }

  void removeHeight() {
    height--;
    emit(UpdateHeight());
  }

  void resetHeight() {
    height = 0;
    emit(UpdateHeight());
  }

  String? calculate() {
    bmi = weight / (pow((height / 100), 2));
    emit(UpdateBmI());
    if (bmi < 16) {
      return type = "Severe Thinness";
    } else if (bmi >= 16 && bmi < 17) {
      return type = "Moderate Thinness";
    } else if (bmi >= 17 && bmi < 18.5) {
      return type = "Mild Thinness";
    } else if (bmi >= 18.5 && bmi < 25) {
      return type = "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      return type = "Overweight";
    } else if (bmi >= 30 && bmi < 35) {
      return type = "Obese Class I";
    } else if (bmi >= 35 && bmi < 40) {
      return type = "Obese Class II";
    } else if (bmi >= 40) {
      return type = "Obese Class III";
    }

    return null;
  }
}
