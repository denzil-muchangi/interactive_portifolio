import 'dart:async';
import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  AnimationController? drawerAnimationController;
  AnimationController? iconAnimationController;
  bool isDrawerOpen = false;
  Timer? autoHideTimer;

  void initialize(TickerProvider vsync) {
    if (drawerAnimationController == null) {
      drawerAnimationController = AnimationController(
        vsync: vsync,
        duration: const Duration(milliseconds: 300),
      );
      iconAnimationController = AnimationController(
        vsync: vsync,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  void openDrawer() {
    isDrawerOpen = true;
    drawerAnimationController!.forward();
    iconAnimationController!.forward();
    _startAutoHideTimer();
    notifyListeners();
  }

  void closeDrawer() {
    isDrawerOpen = false;
    drawerAnimationController!.reverse();
    iconAnimationController!.reverse();
    autoHideTimer?.cancel();
    notifyListeners();
  }

  void _startAutoHideTimer() {
    autoHideTimer?.cancel();
    autoHideTimer = Timer(const Duration(minutes: 1), () {
      if (isDrawerOpen) {
        closeDrawer();
      }
    });
  }

  void resetTimer() {
    _startAutoHideTimer();
  }

  @override
  void dispose() {
    drawerAnimationController?.dispose();
    iconAnimationController?.dispose();
    autoHideTimer?.cancel();
    super.dispose();
  }
}
