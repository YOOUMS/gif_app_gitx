import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gif_app/AppRouter/AppRouter.dart';
import 'package:gif_app/Helpers/DioHelper.dart';
import 'package:gif_app/Helpers/FireStoreHelper.dart';
import 'package:gif_app/Model/AppUser.dart';
import 'package:gif_app/Model/AppUserGif.dart';
import 'package:gif_app/Providers/AuthProvider.dart';
import 'package:gif_app/Providers/DioProvider.dart';
import 'package:provider/provider.dart';

import '../Model/Gif.dart';

class FireStoreProvider extends ChangeNotifier {
  AppUser? appUser;
  List<AppGif> favoritesGif = [];
  List<AppGif> MyGif = [];
  List<AppGif> otherGif = [];
  bool isLoading = false;

  File? selectedImage;
  GlobalKey<FormState> uploadGifKey = GlobalKey<FormState>();
  TextEditingController gifTitle = TextEditingController();

  FireStoreProvider() {
    getUser();
  }
  saveUser(AppUser appUser) async {
    await FireStoreHelper.instance.saveUser(appUser);
  }

  getUser() async {
    User? user = Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .getCurrentUser();

    appUser = await FireStoreHelper.instance.getUser(user!.uid);
  }

  addOrDeleteFavorites(String id) {

    changeLoadingState();
    if (appUser!.favorites.any((element) => element == id)) {
      appUser!.favorites.remove(id);
    } else {
      appUser!.favorites.add(id);
    }
    FireStoreHelper.instance.updateUser(appUser!);
    fillFavoritesGif();
    notifyListeners();
    changeLoadingState();
  }

  checkFavotites(String id) {
    return appUser!.favorites.contains(id);
  }

  fillFavoritesGif() async {
    changeLoadingState();
    favoritesGif.clear();
    List ApiGif =
        appUser!.favorites.where((element) => !element.contains('-')).toList();
    List FireStoreGif =
        appUser!.favorites.where((element) => element.contains('-')).toList();

    favoritesGif.addAll(await Provider.of<DioProvider>(
            AppRouter.navKey.currentContext!,
            listen: false)
        .getGifByIds(ApiGif));

    favoritesGif.addAll(
        await FireStoreHelper.instance.getFavoriteFromUser(FireStoreGif));
    notifyListeners();
    changeLoadingState();
  }

  clearFavorites() {
    favoritesGif.clear();
    notifyListeners();
  }

  changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  uploadGif() async {
    if (selectedImage == null) {
      AppRouter.showErrorSnackBar('PickFile'.tr());
    } else {
      if (uploadGifKey.currentState!.validate()) {
        changeLoadingState();
        String fileUrl = await uplaodFile();
        AppGif appGif = AppGif(
            type: 'gif',
            id: '',
            title: gifTitle.text,
            fixedUrl: fileUrl,
            originalUrl: fileUrl,
            appUser: AppUserGif(avatarUrl: '', userName: appUser!.username),
            rating: 'me',
            isMyGif: true);
        await FireStoreHelper.instance.uploadGif(appGif, appUser!.id!);
        changeLoadingState();
        gifTitle.clear();
        AppRouter.popWidget();
      }
    }
  }

  uplaodFile() async {
    return await FireStoreHelper.instance
        .uplaodFile(selectedImage!, appUser!.id!);
  }

  getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['gif'],
    );

    if (result!.files.first.extension! == 'gif') {
      selectedImage = File(result.files.first.path ?? '');
      notifyListeners();
    } else {
      AppRouter.showErrorSnackBar('ExtensionError'.tr());
    }
  }

  getMyGifs() async {
    MyGif = await FireStoreHelper.instance.getMyGif(appUser!.id!);
    notifyListeners();
  }

  deleteGif(String gifId) async {
    changeLoadingState();
    await FireStoreHelper.instance.deleteGif(gifId, appUser!.id);
    getMyGifs();
    getUserGif();
    changeLoadingState();
    AppRouter.popWidget();
  }

  emptyValidation(String? value) {
    if (value == null || value.length == 0) return 'Required'.tr();
  }

  getUserGif() async {
    changeLoadingState();

    otherGif = await FireStoreHelper.instance.getUsersGif();
    changeLoadingState();
  }

  getUserName() {
    return appUser!.username;
  }
}
