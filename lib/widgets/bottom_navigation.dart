import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    iconSize: 25,
    elevation: 2,
    currentIndex: selectedIndex,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    selectedIconTheme: IconThemeData(color: primaryColor),
    unselectedIconTheme: IconThemeData(color: Colors.black),
    selectedLabelStyle: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 10,
    ),
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.black,
    unselectedLabelStyle: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 10,
    ),
    onTap: onTap,
    items: bottomNavigationItems(),
  );
}

List<BottomNavigationBarItem> bottomNavigationItems() {
  return [
    BottomNavigationBarItem(
      icon: Icon(Ionicons.home_outline),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.notifications_outline),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.chatbubbles_outline),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.settings_outline),
      label: 'Settings',
    ),
  ];
}
