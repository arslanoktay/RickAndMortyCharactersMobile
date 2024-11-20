import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/views/screens/locations_view.dart/location_viewmodel.dart';
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
    return const SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true, // background resmi appbar arkasına taşır
        body: DecoratedContainer(child: Text("Yapilacak")),
      ),
    );
  }
}

Flexible _locationListView() {
    return Flexible(
                      child: Consumer<LocationViewmodel>(builder: (context, viewModel, child) {
                        if (viewModel.locationModel == null) {
                          return const CircularProgressIndicator.adaptive(); // veri daha gelmemişse bekleme işareti
                        }else {
                          return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: viewModel.locationModel!.locations.length,
                          itemBuilder: (context, index) {
                            final LocationItem location = viewModel.locationModel!.locations[index];
                            return ListTile(
                              leading: const Icon(Icons.face_retouching_natural, size: 36),
                              trailing: const Icon(Icons.arrow_forward_sharp),
                              title: Text(
                                location.name,
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Row(
                                children: [
                                  const Text(
                                    'Tür',
                                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    location.type,
                                    style: const TextStyle(fontSize: 10),
                                  )
                                ],
                              )
                            );
                          },
                          separatorBuilder: (context,index) => Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                            indent: 40,
                            endIndent: 40,
                            height: 0,
                          ));
                        }
                      },),
                    );
  }
