import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/locations_view.dart/location_viewmodel.dart';
import 'package:rickandmorty/views/widgets/decorated_container.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true, // background resmi appbar arkasına taşır
        body: DecoratedContainer(
          child: Text("Yapılacak")
        ),
      ),
    );
  }

  // Flexible _locationListView() {
  //   return Flexible(
  //                     child: Consumer<LocationViewmodel>(builder: (context, viewModel, child) { 
  //                       return ListView.separated(
  //                         padding: EdgeInsets.zero,
  //                         itemCount: 0,
  //                         itemBuilder: (context, index) {
  //                           return ListTile(
  //                             leading: const Icon(Icons.face_retouching_natural, size: 36),
  //                             trailing: const Icon(Icons.arrow_forward_sharp),
  //                             title: Text(viewModel.episode, style: const TextStyle(fontWeight: FontWeight.w500),),
  //                             subtitle: Text(model.name, style: const TextStyle(
  //                               fontSize: 12
  //                             ),),
  //                           );
  //                         }, 
  //                         separatorBuilder: (context,index) => Divider(
  //                           color: Theme.of(context).colorScheme.tertiary,
  //                           indent: 40,
  //                           endIndent: 40,
  //                           height: 0,
  //                         ));
  //                     },),
  //                   );
  // }
}