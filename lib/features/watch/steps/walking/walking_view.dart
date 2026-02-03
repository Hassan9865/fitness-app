// import 'package:fitness_app/components/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:go_router/go_router.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:provider/provider.dart';
// import 'package:fitness_app/components/default_text_style.dart';
// import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
//     as bg;

// class Walkingview extends StatefulWidget {
//   const Walkingview({super.key});

//   @override
//   State<Walkingview> createState() => _WalkingviewState();
// }

// class _WalkingviewState extends State<Walkingview> {
//   final MapController _mapController = MapController();
//   List<LatLng> _movementPath = [];
//   bool _isTracking = false;

//   @override
//   void initState() {
//     super.initState();
//     _configureBackgroundGeolocation();
//   }

//   @override
//   void dispose() {
//     bg.BackgroundGeolocation.stop();
//     super.dispose();
//   }

//   void _configureBackgroundGeolocation() {
//     bg.BackgroundGeolocation.onLocation((bg.Location location) {
//       final coords = location.coords;
//       final latLng = LatLng(coords.latitude, coords.longitude);

//       setState(() {
//         _movementPath.add(latLng);
//       });

//       _moveCamera(latLng);
//     });

//     bg.BackgroundGeolocation.ready(bg.Config(
//       desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
//       distanceFilter: 10.0, // meters
//       stopOnTerminate: false,
//       startOnBoot: false,
//       debug: true,
//       logLevel: bg.Config.LOG_LEVEL_VERBOSE,
//     ));
//   }

//   void _startTracking() {
//     bg.BackgroundGeolocation.start();
//     setState(() {
//       _isTracking = true;
//     });
//   }

//   void _stopTracking() {
//     bg.BackgroundGeolocation.stop();
//     setState(() {
//       _isTracking = false;
//     });
//   }

//   void _moveCamera(LatLng latLng) {
//     _mapController.move(latLng, 15.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appColors = Provider.of<AppColors>(context);

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appColors.onBackground,
//         appBar: AppBar(
//           backgroundColor: appColors.onBackground,
//           centerTitle: true,
//           leading: FloatingActionButton(
//             elevation: 10,
//             backgroundColor: appColors.onBackground,
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(Icons.arrow_back_ios_new),
//           ),
//           title: Text(
//             "Walking",
//             style: defaultTextStyle(appColors: appColors, fontSize: 20),
//           ),
//         ),
//         body: Stack(
//           children: [
//             FlutterMap(
//               mapController: _mapController,
//               options: MapOptions(
//                 initialCenter: LatLng(37.7749, -122.4194),
//                 initialZoom: 16.0,
//                 maxZoom: 18.0,
//                 minZoom: 3.0,
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate:
//                       "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                   subdomains: ['a', 'b', 'c'],
//                 ),
//                 if (_movementPath.isNotEmpty)
//                   PolylineLayer(
//                     polylines: [
//                       Polyline(
//                         points: _movementPath,
//                         strokeWidth: 4.0,
//                         color: Colors.blue,
//                       ),
//                     ],
//                   ),
//                 if (_movementPath.isNotEmpty)
//                   MarkerLayer(
//                     markers: [
//                       Marker(
//                         point: _movementPath.last,
//                         width: 40,
//                         height: 40,
//                         child: const Icon(Icons.location_pin,
//                             color: Colors.red, size: 40),
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//             Positioned(
//               bottom: 30,
//               left: 20,
//               right: 20,
//               child: ElevatedButton(
//                 onPressed: _isTracking ? _stopTracking : _startTracking,
//                 child: Text(_isTracking ? 'Stop' : 'Start Walking'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
