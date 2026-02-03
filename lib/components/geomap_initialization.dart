// import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
//     as bg;

// void initBackgroundGeolocation() {

//   bg.BackgroundGeolocation.onLocation((bg.Location location) {
//     print('[location] - ${location.coords.latitude}, ${location.coords.longitude}');
//   });

//   bg.BackgroundGeolocation.ready(bg.Config(
//     desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
//     distanceFilter: 10.0,
//     stopOnTerminate: false,
//     startOnBoot: true, 
//     debug: true,            
//     logLevel: bg.Config.LOG_LEVEL_VERBOSE,
//   )).then((bg.State state) {
//     if (!state.enabled) {
//       bg.BackgroundGeolocation.start();
//     }
//   });
// }