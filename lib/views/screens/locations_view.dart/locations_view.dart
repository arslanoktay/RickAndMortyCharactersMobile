import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/views/screens/locations_view.dart/location_listview.dart';
import 'package:rickandmorty/views/screens/locations_view.dart/location_viewmodel.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/decorated_container.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {

  @override
  void initState() {
    context.read<LocationViewmodel>().getLocations();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true, // background resmi appbar arkasına taşır
        appBar: const AppbarWidget(
          title: 'Konumlar',
          transparentBackground: true,
        ),
        body: Center(
          child: DecoratedContainer(
            topChild: const SizedBox(height: 74,),
            child: _locationListView()
          ),
        ),
      ),
    );
  }
}

Flexible _locationListView() {
    return Flexible(
                      child: Consumer<LocationViewmodel>(builder: (context, viewModel, child) {
                        if (viewModel.locationModel == null) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive()
                          );
                        }else {
                          return Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: LocationListView(
                              locationModel: viewModel.locationModel!, 
                              onLoadMore: viewModel.getMoreLocations,
                              loadMore: viewModel.loadMore,
                            ),
                          );
                        }
                      },),
                    );
  }


