import 'package:flutter/material.dart';

class LoadNetworkImage extends StatelessWidget {
  final String url;
  final double height;

  final double width;

  const LoadNetworkImage({
    super.key,
    required this.url,
    this.height= 118,
    this.width= 118,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
        );
      },
    );
  }
}
