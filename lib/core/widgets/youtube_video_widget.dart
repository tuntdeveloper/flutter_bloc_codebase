import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoWidget extends StatefulWidget {
  final String videoUrl;
  final double aspectRatio;

  const YouTubeVideoWidget({super.key, required this.videoUrl, this.aspectRatio = 16 / 9});

  @override
  State<YouTubeVideoWidget> createState() => _YouTubeVideoWidgetState();
}

class _YouTubeVideoWidgetState extends State<YouTubeVideoWidget> {
  late YoutubePlayerController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializePlayer();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.play();
    });
  }

  void _initializePlayer() {
    try {
      final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      if (videoId == null || videoId.isEmpty) {
        setState(() {
          _hasError = true;
          _errorMessage = 'Invalid YouTube URL';
          _isLoading = false;
        });
        return;
      }

      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          loop: false,
          enableCaption: false,
          controlsVisibleAtStart: false,
          hideControls: true,
        ),
      );

      _controller.addListener(() {
        if (!mounted) return;

        if (_controller.value.isReady) {
          setState(() {
            _isLoading = false;
            _hasError = false;
          });
        }

        if (_controller.value.hasError) {
          setState(() {
            _hasError = true;
            _errorMessage = _controller.value.errorCode.toString();
            _isLoading = false;
          });
        }
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = 'Failed to initialize player: ${e.toString()}';
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: AspectRatio(aspectRatio: widget.aspectRatio, child: _buildPlayerContent()),
    );
  }

  Widget _buildPlayerContent() {
    if (_isLoading) {
      return Container(
        color: Colors.black,
        child: const Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    if (_hasError) {
      return Container(
        color: Colors.grey[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  _errorMessage ?? 'Failed to load video',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                    _hasError = false;
                  });
                  _initializePlayer();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.white,
      progressColors: const ProgressBarColors(
        playedColor: Colors.white,
        handleColor: Colors.white,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.grey,
      ),
    );
  }
}
