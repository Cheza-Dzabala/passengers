import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:passengers/pages/screens/messages.dart';
import 'package:passengers/pages/screens/settings.dart';
import 'package:passengers/utils/colors.dart';
import '../pages/screens/home.dart';
import '../pages/screens/notifications.dart';

List<Widget> screens() {
  return [
    Home(),
    Notifications(),
    Messages(),
    Settings(),
  ];
}

BottomNavigationBar bottomNavigationBar({
  required Function(int) onTap,
  required int selectedIndex,
}) {
  return BottomNavigationBar(
    iconSize: 18,
    elevation: 2,
    currentIndex: selectedIndex,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    selectedIconTheme: IconThemeData(color: primaryColor),
    unselectedIconTheme: IconThemeData(color: Colors.black),
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.black,
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    onTap: onTap,
    items: bottomNavigationItems(),
  );
}

List<BottomNavigationBarItem> bottomNavigationItems() {
  return [
    BottomNavigationBarItem(
      icon: Icon(Ionicons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.notifications),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.chatbubbles),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.settings_outline),
      label: 'Settings',
    ),
  ];
}
