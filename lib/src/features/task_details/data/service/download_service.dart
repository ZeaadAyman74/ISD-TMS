import 'dart:io';
import 'package:dio/dio.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

class DownloadService {
  const DownloadService(this._dio);

  final Dio _dio;

  Future<String> get localPath async {
    if (Platform.isAndroid) {
      // final directory = await getDownloadsDirectory();
      return '/storage/emulated/0/Download';
    } else {
      final Directory directory = await getApplicationDocumentsDirectory();
      return directory.path;
    }
  }


  Future<File> localFile(String fileName) async {
    final path = await localPath;
    return File('$path/$fileName');
  }

  Future<String> downloadFile({
    required String url,
    required String fileName,
    Function(int received, int total)? onProgress,
    bool notificationAfterDownload = true,
  }) async {
    try {
      final file = await localFile(fileName);
      printMe(file.path);
      printMe(fileName);
      await _dio.download(
        url,
        file.path,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
        onReceiveProgress: onProgress,
      );
      if (Platform.isAndroid) {
        await MediaStore.ensureInitialized();
        MediaStore.appFolder = 'Documents';
        // Save to public Documents using MediaStore
        final mediaStore = MediaStore();
        await mediaStore.saveFile(
          tempFilePath: file.path,
          dirName: DirName.download,
          dirType: DirType.download,
          // relativePath: "Aware",
        );
      }
      if (notificationAfterDownload) {
        if(Platform.isAndroid){
          showDownloadNotification(initPath: "/storage/emulated/0/Download",dirName: "Documents",fileName:fileName);
        }else {
          showDownloadNotification(fullPath: file.path);
        }
      }
      return file.path;
    } catch (error) {
      printMeLog("Download Error: $error");
      throw "Failed to download file";
    }
  }

  //----------------------------------------------------------------------------

  void showDownloadNotification({String? fullPath,String? initPath,String? dirName,String? fileName}) {
    String? path;
    if(fullPath!=null){
      path=fullPath;
    }else {
      path="$initPath/$dirName/$fileName";
    }
    // DownloadNotifications.showDownloadNotification(
    //   DownloadNotificationModel(
    //     title: 'تم التحميل بنجاح',
    //     message: "انقر لقتح الملف",
    //     payload: PayloadModel(filePath: path, type: "download"),
    //   ),
    // );
  }

  //----------------------------------------------------------------------------

  Future<bool> requestPermissions() async {
    if (Platform.isAndroid) {
      if (await Permission.photos.request().isGranted) {
        return true;
      } else if (await Permission.storage.request().isGranted) {
        return true;
      } else if (await Permission.manageExternalStorage.request().isGranted) {
        return true;
      }
    } else if (Platform.isIOS) {
      if (await Permission.photos.request().isGranted) {
        return true;
      }
    }

    if (await Permission.photos.isPermanentlyDenied ||
        await Permission.storage.isPermanentlyDenied ||
        await Permission.manageExternalStorage.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    return false;
  }

  //----------------------------------------------------------------------------

  Future<String> getUniqueFilePath(String dirPath, String fileName) async {
    String baseName = path.basenameWithoutExtension(fileName);
    String extension = path.extension(fileName);
    String newFilePath = path.join(dirPath, fileName);
    while (await File(newFilePath).exists()) {
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      newFilePath = path.join(dirPath, '${baseName}_$timestamp$extension');
    }

    return newFilePath;
  }
}
