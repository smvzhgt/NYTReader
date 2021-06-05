import 'media_metadata.dart';

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadata> mediaMetadata = List<MediaMetadata>.empty(growable: true);

  Media({
    String? type,
    String? subtype,
    String? caption,
    String? copyright,
    int? approvedForSyndication,
    required List<MediaMetadata> mediaMetadata,
  });

  Media.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
    approvedForSyndication = json['approved_for_syndication'];
    if (json['media-metadata'] != null) {
      mediaMetadata = List<MediaMetadata>.empty(growable: true);
      json['media-metadata'].forEach((v) {
        mediaMetadata.add(MediaMetadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['subtype'] = this.subtype;
    data['caption'] = this.caption;
    data['copyright'] = this.copyright;
    data['approved_for_syndication'] = this.approvedForSyndication;
    if (this.mediaMetadata.isNotEmpty) {
      data['media-metadata'] =
          this.mediaMetadata.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
