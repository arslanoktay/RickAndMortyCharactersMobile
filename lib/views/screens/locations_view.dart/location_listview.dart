import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/models/location_model.dart';

class LocationListView extends StatefulWidget {
  final LocationModel locationModel;
  final VoidCallback? onLoadMore;
  final bool loadMore;
  const LocationListView({super.key, required this.locationModel, this.onLoadMore, required this.loadMore});

  @override
  State<LocationListView> createState() => _LocationListViewState();
}

class _LocationListViewState extends State<LocationListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _detectScrollBottom();
    super.initState();
  }

  void _detectScrollBottom() {
    if (widget.onLoadMore != null) {
      _scrollController.addListener(() {
        final maxSCroll = _scrollController.position.maxScrollExtent;
        final currentPosition = _scrollController.position.pixels;
        const int delta = 200; // 200 pixel kala istek atsın

        if (maxSCroll - currentPosition <= delta) {
          widget.onLoadMore!();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
                          controller: _scrollController,
                          padding: EdgeInsets.zero,
                          itemCount: widget.locationModel.locations.length,
                          itemBuilder: (context, index) {
                            final LocationItem location = widget.locationModel.locations[index];
                            return Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.location_on),
                                  trailing: const Icon(Icons.arrow_forward_sharp),
                                  title: Text(
                                    location.name,
                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      _subtitleWidget(text: 'Tür', value: location.type),
                                      _subtitleWidget(text: 'Kişi Sayısı', value: location.residents.length.toString()),
                                    ],
                                  )
                                ),
                                if (widget.loadMore && index == widget.locationModel.locations.length -1)
                                const CircularProgressIndicator.adaptive()
                              ],
                            );
                          },
                          separatorBuilder: (context,index) => Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                            indent: 40,
                            endIndent: 40,
                            height: 0,
                          ));
  }

  Widget _subtitleWidget({required String text, required String value}) {
  return Row(
                              children: [
                                Text(
                                  text,
                                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  value,
                                  style: const TextStyle(fontSize: 10),
                                )
                              ],
                            );
  }
}

