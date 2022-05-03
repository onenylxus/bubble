// Import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Avatar class
class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.url,
    required this.radius,
  }) : super(key: key);

  const Avatar.small({
    Key? key,
    required this.url,
  }) : radius = 16, super(key: key);

  const Avatar.medium({
    Key? key,
    required this.url,
  }) : radius = 22, super(key: key);

  const Avatar.large({
    Key? key,
    required this.url,
  }) : radius = 44, super(key: key);

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(url),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}
