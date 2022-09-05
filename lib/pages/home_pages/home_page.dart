import 'package:audio_fairy_tales/pages/home_pages/appbar_home.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/view_model.dart';
import '../../repositories/user_repositories.dart';
import '../../widgets/main_page_widgets/audio_stack.dart';
import '../main_pages/collections_pages/collections_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  static Widget create() {
    return const HomePage();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionsRepositories repCollections = CollectionsRepositories();
  final UserRepositories repUser = UserRepositories();
  Future<void> subscriptionDone(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection(repCollections.user!.phoneNumber!)
        .get()
        .then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        final bool subscription = result.data()['subscription'] ?? true;
        if (subscription == false) {
          Provider.of<Navigation>(context, listen: false).setCurrentIndex = 7;
        }
      }
    });
  }

  @override
  void initState() {
    // repUser.limitNotSubscription();
    subscriptionDone(context);
    // AudioRepositories().finishDelete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.colorAppbar,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight * 0.89,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                flex: 8,
                child: AppbarHeaderHomePage(),
              ),
              Expanded(flex: 11, child: AudioStackWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
