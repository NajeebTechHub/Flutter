class YoutubeVideo {
  final String videoId;
  final String title;
  final String thumbnailUrl;

  YoutubeVideo({
    required this.videoId,
    required this.title,
    required this.thumbnailUrl,
  });

  factory YoutubeVideo.fromItem(Map<String, dynamic> json) {
    return YoutubeVideo(
      videoId: json['id']?['videoId'] ?? '',
      title: json['snippet']?['title'] ?? '',
      thumbnailUrl: json['snippet']?['thumbnails']?['high']?['url'] ?? '',
    );
  }
}
