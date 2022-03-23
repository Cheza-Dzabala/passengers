import 'dart:typed_data';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:passengers/models/profile.model.dart';
import 'package:passengers/services/fileUpload.service.dart';
import 'package:passengers/utils/colors.dart';

import '../providers/user_provider.dart';
import '../services/locator.dart';

class PassengersAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const PassengersAppBar({Key? key}) : super(key: key);

  @override
  _PassengersAppBarState createState() => _PassengersAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _PassengersAppBarState extends ConsumerState<PassengersAppBar> {
  FileService _fileService = locator<FileService>();
  late Future _future;
  late Profile profile;

  @override
  void initState() {
    super.initState();
    profile = ref.read(profileProvider).state;
    _future = _fileService.getImage(fileId: profile.avatar);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: false,
      title: Text(
        'Welcome, ${profile.displayName}.',
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
      ),
      actions: [
        FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Icon(
                        Ionicons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                print(snapshot.error);
                return IconButton(
                  icon: Icon(Icons.error),
                  onPressed: () {},
                );
              }
              Uint8List bytes = snapshot.data as Uint8List;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor),
                  ),
                  child: CircleAvatar(
                    backgroundImage: MemoryImage(bytes),
                  ),
                ),
              );
            })
      ],
    );
  }
}
