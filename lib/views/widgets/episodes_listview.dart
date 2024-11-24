import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/models/episode_model.dart';

class EpisodesListview extends StatefulWidget {
  final List<EpisodeModel> episodes;
  final bool loadMore;
  final VoidCallback? onLoadMore;
  const EpisodesListview({super.key, required this.episodes, this.onLoadMore, this.loadMore = false});

  @override
  State<EpisodesListview> createState() => _EpisodesListviewState();
}

class _EpisodesListviewState extends State<EpisodesListview> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listenScroll();
  }

  void _listenScroll() {
    _scrollController.addListener(() {
      if (widget.onLoadMore == null) return;
      final maxScroll = _scrollController.position.maxScrollExtent; // max alt nokta
      final currentPosition = _scrollController.position.pixels; // current position
      const delta = 200; // en alta yaklaşmaya yakın değer

      if (maxScroll - currentPosition <= delta) { // buraya giriyorsa en alta yakşamıştır
        widget.onLoadMore!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: widget.episodes.length,
              itemBuilder: (context, index) {
                final EpisodeModel model = widget.episodes[index];
                return Column(
                  children: [
                    ListTile(
                      onTap: () => context.push(AppRoutes.sectionCharacters, extra: model),
                      leading: const Icon(Icons.face_retouching_natural, size: 36),
                      trailing: const Icon(Icons.arrow_forward_sharp),
                      title: Text(
                        model.episode,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        model.name,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    if (widget.loadMore && index == widget.episodes.length -1)
                      const CircularProgressIndicator.adaptive(),
                  ],
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).colorScheme.tertiary,
                    indent: 40,
                    endIndent: 40,
                    height: 0,
                  ));
  }
}