import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passengers/providers/user_provider.dart';
import 'package:passengers/widgets/app_bar.dart';
import 'package:passengers/widgets/circular_fab.dart';

import '../models/profile.model.dart';
import '../widgets/bottom_navigation.dart';

class Layout extends ConsumerStatefulWidget {
  static String id = '/layout';
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends ConsumerState<Layout> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PassengersAppBar(),
      backgroundColor: Colors.white,
      body: screens().elementAt(_selectedIndex),
      floatingActionButton: CircularFab(),
      bottomNavigationBar: bottomNavigationBar(
        onTap: _onTap,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
