
import 'package:e_commerce/domain/auth/usecases/get_ages.dart';
import 'package:e_commerce/presentation/auth/bloc/ages_display_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {

  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    
    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold(
      (message) {
        emit(
          AgesLoadFailure(message: message)
        );
      },
      (data) {
        emit(
          AgesLoaded(ages: data)
        );
      }
    );

  }
}
/*
import 'package:e_commerce/domain/auth/usecases/get_ages.dart';
import 'package:e_commerce/presentation/auth/bloc/ages_display_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold(
      (message) {
        emit(AgesLoadFailure(message: message));
      },
      (data) {
        // Sort by the starting number of each age string (e.g., 18 from "18-24")
        data.sort((a, b) {
          int extractStart(String s) {
            final match = RegExp(r'\d+').firstMatch(s);
            return match != null ? int.parse(match.group(0)!) : 999;
          }

          return extractStart(a).compareTo(extractStart(b));
        });

        emit(AgesLoaded(ages: data));
      },
    );
  }
}*/

