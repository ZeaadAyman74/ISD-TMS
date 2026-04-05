import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper {
  PermissionsHelper._();

  static Future<bool> checkStoragePermission() async {
    bool status = false;
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      int androidVersion = int.parse(androidInfo.version.release);
      if (androidVersion > 10) {
        status = true;
      } else {
        await Permission.storage
            .onDeniedCallback(() {
          status = false;
        })
            .onGrantedCallback(() {
          status = true;
        })
            .onPermanentlyDeniedCallback(() {
          status = false;
        })
            .onRestrictedCallback(() {
          status = true;
        })
            .onLimitedCallback(() {
          status = true;
        })
            .onProvisionalCallback(() {
          status = true;
        })
            .request();
      }
    } else {
      status = true;
    }

    return status;
  }
}
