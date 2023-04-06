class ImageAdModel {
  AdLoadState state;
  final String targetUrl;
  final String imageUrl;

  ImageAdModel({
    this.state = AdLoadState.failLoad,
    this.targetUrl = '',
    this.imageUrl = '',
  });
}

enum AdLoadState {
  successLoad,
  failLoad,
}
