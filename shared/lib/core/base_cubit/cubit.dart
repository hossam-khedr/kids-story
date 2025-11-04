import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/base_cubit/states.dart';
import 'package:shared/core/network/network_info.dart';

// class BaseCubit extends Cubit<BaseStates>{
//   NetworkInfo networkInfo;
//   StreamSubscription<bool>? _subscription;
//   BaseCubit({required this.networkInfo}):super(InitBaseState()){
//     _subscription = networkInfo.onConnectionChange.listen((connected){
//       if(connected){
//         emit(ConnectionConnectedState());
//       }else{
//         emit(ConnectionDisconnectedState());
//       }
//     });
//   }
//
//
//
//   @override
//   Future<void> close() async {
//     await _subscription?.cancel();
//     return super.close();
//   }
// }