// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared/core/base_cubit/cubit.dart';
// import 'package:shared/core/base_cubit/states.dart';
// import 'package:shared/core/network/network_info.dart';
// import 'package:shared/utils/helpers/widgets/no_internet_screen.dart';
//
// class BaseCubitWrapper extends StatelessWidget {
//   final Widget child;
//
//   const BaseCubitWrapper({super.key, required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => BaseCubit(networkInfo: NetworkInfoImpl()),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: BlocBuilder<BaseCubit, BaseStates>(
//           builder: (context, state) {
//             if (state is ConnectionDisconnectedState) {
//               return const NoInternetScreen();
//             }
//             return child;
//           },
//         ),
//       ),
//     );
//   }
// }