import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../config/appIconsAndImages.dart';
import '../config/app_strings.dart';


class NearbyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.nearby),
      ),

        body: FlutterMap(
            options: MapOptions(
                center: LatLng(5.9631, 10.1591),
              zoom: 10
            ),

          children: <Widget>[
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.ces.flutter',
            ),

            MarkerLayer(
              markers: [
                Marker(
                    width: 100,
                    height: 55,
                    point: LatLng(5.9631, 10.1591),
                    builder: (context){
                  return Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          color: Colors.white,
                        ),

                        child: Text(
                            'Username',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),

                      ),

                      AppIcons.location,
                    ],
                  );
                }),
              ],
            )
          ],
        )
    );
  }
}
