import 'package:flutter/widgets.dart';
import 'package:red_tangerine/utils/responsive_size.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.fromNetwork,
    required this.image,
    this.height = double.infinity,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  });
  final bool fromNetwork;
  final String image;
  final double height;
  final double width;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    if (fromNetwork) {
      return Image.network(
        image,
        height: ResponsiveSize.height(height),
        width: ResponsiveSize.width(width),
      );
    } else {
      return Image.asset(
        image,
        height: ResponsiveSize.height(height),
        width: ResponsiveSize.width(width),
        fit: BoxFit.fill,
      );
    }
  }
}
