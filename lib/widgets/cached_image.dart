import 'package:extended_image/extended_image.dart';
import 'package:movie_explorer/imports.dart';

class CachedImage extends StatefulWidget {
  CachedImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.maxHeight,
  });
  double? width;
  double? height;
  double? maxHeight;
  String url;

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.url,
      cache: true,
      clearMemoryCacheWhenDispose: true,
      height: widget.height,
      width: widget.width,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Transform.scale(
              scale: 0.5,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1,
              ),
            );

          case LoadState.completed:
            return ExtendedRawImage(
              image: state.extendedImageInfo?.image,
            );

          case LoadState.failed:
            return Icon(Icons.image, color: Colors.grey);

          default:
            return Container();
        }
      },
    );
  }
}
