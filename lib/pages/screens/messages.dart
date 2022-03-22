import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Messages extends ConsumerStatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends ConsumerState<Messages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Messages')),
    );
  }
}
