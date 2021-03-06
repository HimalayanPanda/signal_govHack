import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signal_flutter_v2/components/bottom_sheet.dart';
import 'package:signal_flutter_v2/data/area_update_card_lists.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController _mapController;
  Set<Marker> _markers = HashSet<Marker>();
  BitmapDescriptor _customIcon;
  Position _position;
  // @override
  // void initState() {
  //   super.initState();
  //   BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(15, 15)),
  //           "/lib/assets/images/fire_icon.png")
  //       .then((icon) {
  //     _customIcon = icon;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getPosition() async {
    _position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  //The initial method that runs everytime Google Maps Opens
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _addMarkerList();
      getPosition();
      print(_position);
    });
  }

  void _addMarkerList() {
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("1"),
          position: LatLng(-30.501446, 145.702932),
          onTap: () => {
                showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context, scrollController) {
                      return CustomBottomSheet(
                          imageURL:
                              "https://www.nationalparks.nsw.gov.au/-/media/npws/images/parks/gundabooka-national-park/valley-of-eagles/valley-of-eagles-walk-01.jpg",
                          reports: "432",
                          location: "Gundabrooka",
                          isSafe: false,
                          rfsResponse: "in area",
                          areaUpdateCardsList: gundabrookaUpdateCardList);
                    }),
              },
          infoWindow: InfoWindow(
            title: "Gunderbrooka",
            snippet: "🔥🔥🔥",
          )),
    );
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("2"),
          position: LatLng(-32.705166, 145.567595),
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Container();
                });
          },
          infoWindow: InfoWindow(
            title: "Yathong",
            snippet: "No Fire",
          )),
    );
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("3"),
          position: LatLng(-33.072026, 145.865550),
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Container();
                });
          },
          infoWindow: InfoWindow(
            title: "Nohimbinnie Nature Reserve",
            snippet: "No Fire",
          )),
    );
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("4"),
          position: LatLng(-29.095658, 141.426478),
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Container();
                });
          },
          infoWindow: InfoWindow(
            title: "Stuart National Park",
            snippet: "No Fire",
          )),
    );
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("5"),
          position: LatLng(-30.962721, 142.693419),
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Container();
                });
          },
          infoWindow: InfoWindow(
            title: "Mutawinji",
            snippet: "No Fire",
          )),
    );
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("7"),
          position: LatLng(-33.768513, 146.281073),
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Container();
                });
          },
          infoWindow: InfoWindow(
            title: "Jimberoo National Park",
            snippet: "No Fire",
          )),
    );
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("8"),
          position: LatLng(-34.035388, 146.194336),
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Container();
                });
          },
          infoWindow: InfoWindow(
            title: "Cococapra",
            snippet: "Fire",
          )),
    );
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("9"),
          position: LatLng(-31.769398, 150.101581),
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Container();
                });
          },
          infoWindow: InfoWindow(
            title: "Coolah Tops",
            snippet: "No Fire",
          )),
    );
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("10"),
          position: LatLng(-31.621455, 152.016470),
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Container();
                });
          },
          infoWindow: InfoWindow(
            title: "Bugan National Reserve",
            snippet: "No Fire",
          )),
    );
    _markers.add(
      Marker(
          //todo change marker id -> unique
          markerId: MarkerId("0"),
          position: LatLng(-33.777837, 147.800537),
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context, scrollController) {
                  return Container();
                });
          },
          infoWindow: InfoWindow(
            title: "Pullabooka",
            snippet: "No Fire",
          )),
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    //scaffold is the base of any page that you make
    return Scaffold(
        body: Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(-33.8688, 151.2093),
            zoom: 12,
          ),
          markers: _markers,
        ),
        Positioned(
          bottom: 15,
          child: IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => showCupertinoModalBottomSheet(
              context: context,
              builder: (context, scrollController) => Container(
                child: Column(
                  children: <Widget>[Text("Hello there")],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
