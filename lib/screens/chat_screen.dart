// Import
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble/constants/constants.dart';
import 'package:bubble/models/models.dart';
import 'package:bubble/widgets/widgets.dart';

// Chat screen class
class ChatScreen extends StatelessWidget {
  const ChatScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MessageData data;

  static Route route(MessageData data) => MaterialPageRoute(
    builder: (context) => ChatScreen(data: data),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTransparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: GestureIcon.fill(
            icon: CupertinoIcons.back,
            callback: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: _AppBarTitle(data: data),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: GestureIcon.border(
                icon: CupertinoIcons.video_camera_solid,
                callback: () {}
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: GestureIcon.border(
                icon: CupertinoIcons.phone_solid,
                callback: () {}
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(child: _DemoMessageList()),
          _ActionBar(),
        ],
      ),
    );
  }
}

// App bar title class
class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MessageData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(url: data.avatarUrl),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Online now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.green,
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }
}

// Date label class
class _DateLabel extends StatelessWidget {
  const _DateLabel({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(
              date,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: colorTextFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Message tile class
class _MessageTile extends StatelessWidget {
  const _MessageTile({
    Key? key,
    required this.message,
    required this.date,
    required this.send,
  }) : super(key: key);

  const _MessageTile.receive({
    Key? key,
    required this.message,
    required this.date,
  }) : send = false, super(key: key);

  const _MessageTile.send({
    Key? key,
    required this.message,
    required this.date,
  }) : send = true, super(key: key);

  final String message;
  final String date;
  final bool send;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Align(
        alignment: send ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: send ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: send ? colorTint : Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(26),
                  topRight: const Radius.circular(26),
                  bottomLeft: Radius.circular(send ? 26 : 0),
                  bottomRight: Radius.circular(send ? 0 : 26),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text(
                  message,
                  style: send ? const TextStyle(color: colorTextLight) : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: colorTextFaded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Action bar class
class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 2,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                CupertinoIcons.camera_fill,
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something',
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 24),
            child: ActionButton(
              color: colorAccent,
              icon: Icons.send_rounded,
              callback: () {},
            ),
          ),
        ],
      ),
    );
  }
}

// Demo message list class
class _DemoMessageList extends StatelessWidget {
  const _DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        children: const [
          _DateLabel(date: 'Yesterday'),
          _MessageTile.receive(
            message: 'Hi!',
            date: '12:01 PM',
          ),
          _MessageTile.send(
            message: 'How are you?',
            date: '12:02 PM',
          ),
        ],
      ),
    );
  }
}
