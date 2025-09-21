import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';

class NavigationController extends GetxController implements TickerProvider {
  RxBool isDrawerOpen = false.obs;
  Rx<Timer?> autoHideTimer = Rx<Timer?>(null);
  late AnimationController drawerAnimationController;
  late AnimationController iconAnimationController;

  @override
  void onInit() {
    super.onInit();
    drawerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void openDrawer() {
    isDrawerOpen.value = true;
    drawerAnimationController.forward();
    iconAnimationController.forward();
  }

  void closeDrawer() {
    isDrawerOpen.value = false;
    drawerAnimationController.reverse();
    iconAnimationController.reverse();
  }

  void resetTimer() {
    autoHideTimer.value?.cancel();
    autoHideTimer.value = Timer(const Duration(seconds: 5), () {
      closeDrawer();
    });
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }

  @override
  void onClose() {
    drawerAnimationController.dispose();
    iconAnimationController.dispose();
    autoHideTimer.value?.cancel();
    super.onClose();
  }
}
