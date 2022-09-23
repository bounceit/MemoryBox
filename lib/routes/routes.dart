import 'package:audio_fairy_tales/pages/anim/screen_saver/screen_saver.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/search_page/search_page.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/subscriptions_page/subscription_page.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/support_page/support_page.dart';
import 'package:flutter/material.dart';

import '../pages/auth_pages/first_auth_page.dart';
import '../pages/auth_pages/first_wight_page.dart';
import '../pages/auth_pages/initializer_widget.dart';
import '../pages/auth_pages/last_auth_page.dart';
import '../pages/auth_pages/registration_pages/registration_page.dart';
import '../pages/drawer_pages/audio_delete_pages/audio_delete_page.dart';
import '../pages/home_pages/home_page.dart';
import '../pages/main_of_main.dart';
import '../pages/main_pages/all_audio_pages/sellections_page.dart';
import '../pages/main_pages/collections_pages/add_audio_in_collection/add_audio_in_collection.dart';
import '../pages/main_pages/collections_pages/collection_item/collection_item.dart';
import '../pages/main_pages/collections_pages/collection_item_edit/collection_item_edit.dart';
import '../pages/main_pages/collections_pages/collection_item_edit_audio/collection_item_edit_audio.dart';
import '../pages/main_pages/collections_pages/collections/collections.dart';
import '../pages/main_pages/collections_pages/collections_add_audio/collections_add_audio.dart';
import '../pages/main_pages/collections_pages/collections_edit.dart/collections_edit.dart';
import '../pages/main_pages/profile_pages/profile_page/profile.dart';
import '../pages/save_pages/save_page.dart';
import '../pages/voise_pages/voice_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;
    WidgetBuilder builder;

    switch (settings.name) {
      case Collections.routeName:
        builder = (_) => const Collections();
        break;

      case HomePage.routeName:
        builder = (_) => const HomePage();
        break;

      case SellectionsPage.routeName:
        builder = (_) => const SellectionsPage();
        break;

      // /collection_add_audio
      case CollectionsAddAudio.routeName:
        final CollectionsAddAudioArguments args =
            arguments as CollectionsAddAudioArguments;
        builder = (_) => CollectionsAddAudio(
              titleCollections: args.titleCollections,
            );
        break;

      // /collection_add_audio_in_collection
      case CollectionAddAudioInCollection.routeName:
        final CollectionAddAudioInCollectionArgument args =
            arguments as CollectionAddAudioInCollectionArgument;
        builder = (_) => CollectionAddAudioInCollection(
              idAudio: args.idAudio,
              collectionAudio: args.collectionAudio,
            );
        break;

      // /collection_edit
      case CollectionsEdit.routeName:
        final CollectionsEditArguments args =
            arguments as CollectionsEditArguments;
        builder = (_) => CollectionsEdit(
              idCollection: args.idCollection!,
              titleCollection: args.titleCollection!,
              subTitleCollection: args.subTitleCollection!,
              imageCollection: args.imageCollection!,
            );
        break;

      // /collection_item
      case CollectionsItemPage.routeName:
        final CollectionsItemPageArguments args =
            arguments as CollectionsItemPageArguments;
        builder = (_) => CollectionsItemPage(
              qualityCollection: args.qualityCollection,
              dataCollection: args.dataCollection,
              titleCollection: args.titleCollection,
              imageCollection: args.imageCollection,
              totalTimeCollection: args.totalTimeCollection,
              subTitleCollection: args.subTitleCollection,
              idCollection: args.idCollection,
            );
        break;

      // /collection_item_edit
      case CollectionItemEditPage.routeName:
        final CollectionItemEditPageArguments args =
            arguments as CollectionItemEditPageArguments;
        builder = (_) => CollectionItemEditPage(
              subTitleCollection: args.subTitleCollection,
              qualityCollection: args.qualityCollection,
              dataCollection: args.dataCollection,
              idCollection: args.idCollection,
              totalTimeCollection: args.totalTimeCollection,
              imageCollection: args.imageCollection,
              titleCollection: args.titleCollection,
            );
        break;

      // /collection_item_edit_audio
      case CollectionItemEditAudio.routeName:
        final CollectionItemEditAudioArguments args =
            arguments as CollectionItemEditAudioArguments;
        builder = (_) => CollectionItemEditAudio(
              subTitleCollection: args.subTitleCollection,
              qualityCollection: args.qualityCollection,
              dataCollection: args.dataCollection,
              idCollection: args.idCollection,
              totalTimeCollection: args.totalTimeCollection,
              imageCollection: args.imageCollection,
              titleCollection: args.titleCollection,
            );
        break;

      case Profile.routeName:
        builder = (_) => const Profile();
        break;

      // /first_wight_page.dart
      case RecordPage.routeName:
        builder = (_) => const RecordPage();
        break;

      case FirstAuthorizationPage.routeName:
        builder = (_) => const FirstAuthorizationPage();
        break;

      case RegistrationPage.routeName:
        builder = (_) => RegistrationPage();
        break;

      case MainPage.routeName:
        builder = (_) => const MainPage();
        break;

      case Screensaver.routeName:
        builder = (_) => const Screensaver();
        break;

      case SubscriptionPage.routeName:
        builder = (_) => const SubscriptionPage();
        break;

      case FirstWightPage.routeName:
        builder = (_) => const FirstWightPage();
        break;

      case LastAuthorizationPage.routeName:
        builder = (_) => const LastAuthorizationPage();
        break;

      case InitializerWidget.routeName:
        builder = (_) => const InitializerWidget();
        break;

      case DeletePage.routeName:
        builder = (_) => const DeletePage();
        break;

      case SupportMessagePage.routeName:
        builder = (_) => const SupportMessagePage();
        break;

      case SavePage.routeName:
        final SavePageArguments args = arguments as SavePageArguments;
        builder = (_) => SavePage(
              audioUrl: args.audioUrl,
              audioDone: args.audioDone,
              audioImage: args.audioImage,
              audioDuration: args.audioDuration,
              audioName: args.audioName,
              audioSearchName: args.audioSearchName,
              audioTime: args.audioTime,
              idAudio: args.idAudio,
              audioCollection: args.audioCollection,
            );
        break;
      case SearchPage.routeName:
        builder = (_) => const SearchPage();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
