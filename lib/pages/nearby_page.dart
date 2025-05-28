import 'package:first_app/cmponents/tool_bar.dart';
import 'package:first_app/config/app_icons.dart';
import 'package:first_app/config/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class NearByPage extends StatelessWidget {
  const NearByPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(title: AppString.nearby),
      body: FlutterMap(
        options: const MapOptions(
            initialCenter: LatLng(51.509364, 0.128928), initialZoom: 10),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.ces.flutter',
            // Plenty of other options available!
          ),
          MarkerLayer(markers: [
            Marker(
              width: 100,
              height: 50,
              point: const LatLng(51.509364, 0.128928),
              child: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            )),
                        child: Text(
                          'Username',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SvgPicture.asset(
                        AppIcon.icLocation,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      )
                    ],
                  );
                },
              ),
            )
          ])
        ],
      ),
    );
  }
}
