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
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    debugPrint('[YouTubePlayer] Initializing player for URL: ${widget.videoUrl}');

    try {
      final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      debugPrint('[YouTubePlayer] Extracted video ID: $videoId');

      if (videoId == null || videoId.isEmpty) {
        debugPrint('[YouTubePlayer] ERROR: Invalid video ID');
        setState(() {
          _hasError = true;
          _errorMessage = 'Invalid YouTube URL';
          _isLoading = false;
        });
        return;
      }

      debugPrint('[YouTubePlayer] Creating controller with video ID: $videoId');
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          loop: false,
          enableCaption: false,
          controlsVisibleAtStart: false,
          hideControls: true,
        ),
      )..addListener(listener);

      debugPrint('[YouTubePlayer] Controller created successfully');
    } catch (e, stackTrace) {
      debugPrint('[YouTubePlayer] EXCEPTION during initialization: $e');
      debugPrint('[YouTubePlayer] Stack trace: $stackTrace');
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = 'Failed to initialize player: ${e.toString()}';
          _isLoading = false;
        });
      }
    }
  }

  void listener() {
    debugPrint(
      '[YouTubePlayer] LISTENER FIRED - isReady: ${_controller.value.isReady}, '
      'hasError: ${_controller.value.hasError}',
    );

    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      // Update UI based on player state if needed
      setState(() {});
    }

    if (_controller.value.hasError) {
      final errorCode = _controller.value.errorCode.toString();
      debugPrint('[YouTubePlayer] ERROR in listener: $errorCode');
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = errorCode;
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    debugPrint('[YouTubePlayer] Disposing controller');
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
    debugPrint(
      '[YouTubePlayer] Building content - isLoading: $_isLoading, hasError: $_hasError, isPlayerReady: $_isPlayerReady',
    );

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
                    _isPlayerReady = false;
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

    debugPrint('[YouTubePlayer] Rendering YoutubePlayer widget');

    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // Reset orientation if needed
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.white,
        progressColors: const ProgressBarColors(
          playedColor: Colors.white,
          handleColor: Colors.white,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.grey,
        ),
        onReady: () {
          debugPrint('[YouTubePlayer] onReady callback triggered');
          _isPlayerReady = true;
          if (mounted) {
            setState(() {
              _isLoading = false;
              _hasError = false;
            });
          }
        },
      ),
      builder: (context, player) {
        if (!_isPlayerReady) {
          debugPrint('[YouTubePlayer] Player not ready yet, showing loading indicator');
          return Container(
            color: Colors.black,
            child: const Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        }
        return player;
      },
    );
  }
}
