import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:namozapp/models/categorydarslik.dart';
import 'package:namozapp/providers/categorydarslik_provider.dart';
import 'package:provider/provider.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CDarslikScreen extends StatefulWidget {
  const CDarslikScreen({Key? key}) : super(key: key);
  static const routeName = '/cdarslik-screen';

  @override
  State<CDarslikScreen> createState() => _CDarslikScreenState();
}

class _CDarslikScreenState extends State<CDarslikScreen> {
  http.Client client = http.Client();
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '',
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
      desktopMode: false,
      privacyEnhanced: true,
      useHybridComposition: true,
    ),
  );
  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  var _categoryDarslik = CategoryDarslik(id: '', title: '', body: '');

  Map<String, dynamic> map = {};

  var _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final data = ModalRoute.of(context)!.settings.arguments;

    setState(() {
      map = data as Map<String, dynamic>;
      _isLoading = true;
    });

    Provider.of<CategoryDarslikProvider>(context)
        .getCategoryDarslik(
            categoryId: map['categoryId'], darslikId: map['darslikId'])
        .catchError((error) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Row(
                children: [
                  Text(
                    'Xatolik!',
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.error,
                    color: Colors.teal,
                  )
                ],
              ),
              content: const Text(
                'Iltimos keyinroq urunib ko\'ring!',
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Tushundim'),
                )
              ],
            );
          });
    }).then((categoryDarslik) {
      setState(() {
        _categoryDarslik = categoryDarslik;
        _isLoading = false;
      });
    });

    _controller = YoutubePlayerController(
        initialVideoId: 'https://youtu.be/YLslsZuEaNE'
        // YoutubePlayer.convertUrlToId('https://youtu.be/YLslsZuEaNE')!,
        // flags:
        //     const YoutubePlayerFlags(mute: false, loop: false, autoPlay: false),
        );
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
          appBar: AppBar(
            title: Text(_categoryDarslik.title),
          ),
          body: _isLoading
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              : _categoryDarslik.title == ''
                  ? const Center(
                      child: Text(
                        'Ma\'lumotlar yo\'q!',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : Column(
                      children: const [
                        player,
                      ],
                    )),
    );
  }
}

// class YoutubeAppDemo extends StatefulWidget {
//   @override
//   _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
// }

// class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: 'tcodrIK2P_I',
//       params: const YoutubePlayerParams(
//         playlist: [
//           'nPt8bK2gbaU',
//           'K18cpp_-gP8',
//           'iLnmTe5Q2Qw',
//           '_WoCV4c6XOE',
//           'KmzdUe0RSJo',
//           '6jZDSSZZxjQ',
//           'p2lYr3vM_1w',
//           '7QUtEmBT_-w',
//           '34_PXCzGw1M',
//         ],
//         startAt: const Duration(minutes: 1, seconds: 36),
//         showControls: true,
//         showFullscreenButton: true,
//         desktopMode: false,
//         privacyEnhanced: true,
//         useHybridComposition: true,
//       ),
//     );
//     _controller.onEnterFullscreen = () {
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//       log('Entered Fullscreen');
//     };
//     _controller.onExitFullscreen = () {
//       log('Exited Fullscreen');
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     const player = YoutubePlayerIFrame();
//     return YoutubePlayerControllerProvider(
//       // Passing controller to widgets below.
//       controller: _controller,
//       child: Scaffold(
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             if (kIsWeb && constraints.maxWidth > 800) {
//               return Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Expanded(child: player),
//                   const SizedBox(
//                     width: 500,
//                     child: SingleChildScrollView(
//                       child: Controls(),
//                     ),
//                   ),
//                 ],
//               );
//             }
//             return ListView(
//               children: [
//                 Stack(
//                   children: [
//                     player,
//                     Positioned.fill(
//                       child: YoutubeValueBuilder(
//                         controller: _controller,
//                         builder: (context, value) {
//                           return AnimatedCrossFade(
//                             firstChild: const SizedBox.shrink(),
//                             secondChild: Material(
//                               child: DecoratedBox(
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage(
//                                       YoutubePlayerController.getThumbnail(
//                                         videoId:
//                                             _controller.params.playlist.first,
//                                         quality: ThumbnailQuality.medium,
//                                       ),
//                                     ),
//                                     fit: BoxFit.fitWidth,
//                                   ),
//                                 ),
//                                 child: const Center(
//                                   child: CircularProgressIndicator(),
//                                 ),
//                               ),
//                             ),
//                             crossFadeState: value.isReady
//                                 ? CrossFadeState.showFirst
//                                 : CrossFadeState.showSecond,
//                             duration: const Duration(milliseconds: 300),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Controls(),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.close();
//     super.dispose();
//   }
// }

// class Controls extends StatelessWidget {
//   ///
//   const Controls();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [],
//       ),
//     );
//   }

//   Widget get _space => const SizedBox(height: 10);
// }
