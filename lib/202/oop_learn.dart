import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:test_application/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  //test edilebilrilik için soyut bir sınıf oluşturma
  bool? downloadItem(FileItem? fileItem);

  Future<void> toShare(String path) async {
    await launchUrl(path as Uri);
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    if (kDebugMode) {
      print('a');
    }
    return true;
  }
  
  void smsShare(){

  }


}
class SMSDownload implements IFileDownload  {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    if (kDebugMode) {
      print('a');
    }
    return true;
  }
  
  @override
  Future<void> toShare(String path) async {
    
    await launchUrl("sms:$path" as Uri);
  }


}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}


mixin ShareMixin on IFileDownload {
  void toShowFile(){}
  


}