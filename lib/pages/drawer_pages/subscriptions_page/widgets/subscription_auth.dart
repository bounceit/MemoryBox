import 'package:audio_fairy_tales/models/user_model.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../../../recursec/app_icons.dart';
import '../../../../repositories/user_repositories.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/buttons/button_continue.dart';
import '../../../../widgets/container_shadow.dart';

// class SubscriptionAuthorisation extends StatelessWidget {
//   SubscriptionAuthorisation({Key? key}) : super(key: key);

//   Widget buildUser(UserModel model) => _Subscription(
//         onceAMonth: model.onceAMonth,
//         onceAYear: model.onceAYear,
//         onlyMonth: model.onlyMonth,
//         finishTimeSubscription: model.finishTimeSubscription,
//       );
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<UserModel>>(
//       stream: _rep.readUser(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Error');
//         }
//         if (snapshot.hasData) {
//           final user = snapshot.data!;
//           return Container(
//             child: user.map(buildUser).toList().single,
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }

// class _Subscription extends StatelessWidget {
//   const _Subscription(
//       {Key? key,
//       required this.onceAMonth,
//       required this.onceAYear,
//       required this.onlyMonth,
//       required this.finishTimeSubscription})
//       : super(key: key);
//   final bool? onceAMonth;
//   final bool? onceAYear;
//   final bool? onlyMonth;
//   final Timestamp? finishTimeSubscription;

//   bool? _getState() {
//     final now = Timestamp.now();
//     final state = finishTimeSubscription!.compareTo(now);
//     if (state >= 0) return true;
//     if (state < 0) return false;
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;

//     return Positioned(
//         left: 5.0,
//         top: 50.0,
//         child: Container(
//           height: screenHeight - 150.0,
//           width: screenWidth * 0.975,
//           decoration: borderContainer2,
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(top: 25.0, bottom: 20.0),
//                 child: Text('Выбери подписку', style: bodyTextStyle),
//               ),
//               _SubscriptionItem(
//                 screenWidth: screenWidth,
//                 onceAMonth: onceAMonth!,
//                 onceAYear: onceAYear!,
//               ),
//               const _WhatDoesASubscriptionGive(),
//               onlyMonth!
//                   ? _getState()!
//                       ? _SubscribeTo(
//                           finishTimeSubscription: finishTimeSubscription,
//                         )
//                       : const _SubscribeNow()
//                   : _SubscribeForAMonth(),
//             ],
//           ),
//         ));
//   }
// }

// class _SubscriptionItem extends StatelessWidget {
//   _SubscriptionItem(
//       {Key? key,
//       required this.screenWidth,
//       required this.onceAMonth,
//       required this.onceAYear})
//       : super(key: key);
//   // final UserRepositories _rep = UserRepositories();
//   final double screenWidth;
//   final bool onceAMonth;
//   final bool onceAYear;
//   bool? done = false;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         ContainerShadow(
//           width: screenWidth * 0.42,
//           height: 175.0,
//           radius: 20.0,
//           widget: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               const Text(
//                 '300р',
//                 style: TextStyle(
//                   fontFamily: 'TTNorm',
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.w200,
//                   color: AppColors.colorText,
//                 ),
//               ),
//               const Text(
//                 'в месяц',
//                 style: TextStyle(
//                   fontFamily: 'TTNorm',
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w200,
//                   color: AppColors.colorText,
//                 ),
//               ),
//               _DoneSubscriptionPage(
//                 done: onceAMonth,
//                 onTap: () {},
//               ),
//             ],
//           ),
//           image: const Text(''),
//         ),
//         ContainerShadow(
//           width: screenWidth * 0.42,
//           height: 175.0,
//           image: const Text(''),
//           radius: 20.0,
//           widget: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               const Text(
//                 '1800р',
//                 style: TextStyle(
//                   fontFamily: 'TTNorm',
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.w200,
//                   color: AppColors.colorText,
//                 ),
//               ),
//               const Text(
//                 'в год',
//                 style: TextStyle(
//                   fontFamily: 'TTNorm',
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w200,
//                   color: AppColors.colorText,
//                 ),
//               ),
//               _DoneSubscriptionPage(
//                 done: onceAYear,
//                 onTap: () {},
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// class _Link extends StatelessWidget {
//   const _Link({Key? key, required this.image, required this.text})
//       : super(key: key);
//   final String image;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Row(
//         children: [
//           Image.asset(
//             image,
//             width: 20.0,
//             height: 20.0,
//           ),
//           const SizedBox(
//             width: 12.0,
//           ),
//           Text(
//             text,
//             style: const TextStyle(
//               fontFamily: 'TTNorm',
//               fontSize: 14.0,
//               fontWeight: FontWeight.w200,
//               color: AppColors.colorText,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _DoneSubscriptionPage extends StatelessWidget {
//   const _DoneSubscriptionPage({
//     Key? key,
//     this.onTap,
//     required this.done,
//   }) : super(key: key);
//   final onTap;
//   final bool done;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.colorText),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(25.0),
//             ),
//           ),
//           child: Center(
//             child: Icon(
//               Icons.done,
//               color: done ? AppColors.colorText : AppColors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _WhatDoesASubscriptionGive extends StatelessWidget {
//   const _WhatDoesASubscriptionGive({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20.0, left: 30.0, bottom: 10.0),
//       child: SizedBox(
//         height: 120.0,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text(
//               'Что дает подписка:',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: AppColors.colorText,
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             _Link(
//                 image: AppIcons.subscriptionInfinity,
//                 text: 'Неограниченая память'),
//             _Link(
//                 image: AppIcons.subscriptionUpload,
//                 text: 'Все файлы хранятся в облаке'),
//             _Link(
//                 image: AppIcons.subscriptionDownload,
//                 text: 'Возможность скачивать без ограничений'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SubscribeTo extends StatelessWidget {
//   const _SubscribeTo({Key? key, required this.finishTimeSubscription})
//       : super(key: key);
//   final Timestamp? finishTimeSubscription;
//   @override
//   Widget build(BuildContext context) {
//     final DateTime date = finishTimeSubscription!.toDate();
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: SizedBox(
//         child: Center(
//             child: Text(
//           'Подписка действует \n        '
//           '   до ${formatDate(date, [
//                 dd,
//                 '.',
//                 mm,
//                 '.',
//                 yy,
//               ])}',
//           style: const TextStyle(
//             fontSize: 20.0,
//             color: AppColors.colorText50,
//           ),
//         )),
//       ),
//     );
//   }
// }

// class _SubscribeNow extends StatelessWidget {
//   const _SubscribeNow({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.only(top: 20.0),
//       child: SizedBox(
//         child: Center(
//             child: Text(
//           'Подпишитесь сейчас!',
//           style: TextStyle(
//             fontSize: 20.0,
//             color: AppColors.colorText50,
//           ),
//         )),
//       ),
//     );
//   }
// }

// class _SubscribeForAMonth extends StatelessWidget {
//   _SubscribeForAMonth({Key? key}) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 25.0, left: 10.0),
//         child: ButtonContinue(
//           onPressed: () {},
//           text: 'Подписаться на месяц',
//         ),
//       ),
//     );
//   }
// }
