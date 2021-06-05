class MediaMetadata {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadata({
    String? url,
    String? format,
    int? height,
    int? width,
  }) {
    this.url = url;
    this.format = format;
    this.height = height;
    this.width = width;
  }

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this.url;
    data['format'] = this.format;
    data['height'] = this.height;
    data['width'] = this.width;
    return data;
  }
}
