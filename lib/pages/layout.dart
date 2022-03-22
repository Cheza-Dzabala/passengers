import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passengers/providers/user_provider.dart';
import 'package:passengers/widgets/app_bar.dart';

import '../models/profile.model.dart';
import '../widgets/bottom_navigation.dart';

class Layout extends ConsumerStatefulWidget {
  static String id = '/layout';
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends ConsumerState<Layout> {
  late Profile profile;

  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      profile = ref.read(profileProvider.state).state;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PassengersAppBar(),
      backgroundColor: Colors.white,
      body: screens().elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('animate'),
        child: Icon(Icons.exit_to_app),
      ),
      bottomNavigationBar: bottomNavigationBar(
        onTap: _onTap,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
