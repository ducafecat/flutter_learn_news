import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/apis/app.dart';
import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/widgets/toast.dart';
import 'package:flutter_ducafecat_news/global.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';

/// app 升级
class AppUpdateUtil {
  static AppUpdateUtil _instance = AppUpdateUtil._internal();
  factory AppUpdateUtil() => _instance;

  BuildContext _context;
  AppUpdateResponseEntity _appUpdateInfo;

  AppUpdateUtil._internal();

  /// 获取更新信息
  Future run(BuildContext context) async {
    _context = context;

    // 提交 设备类型、发行渠道、架构、机型
    AppUpdateRequestEntity requestDeviceInfo = AppUpdateRequestEntity(
      device: Global.isIOS == true ? "ios" : "android",
      channel: Global.channel,
      architecture: Global.isIOS == true
          ? Global.iosDeviceInfo.utsname.machine
          : Global.androidDeviceInfo.device,
      model: Global.isIOS == true
          ? Global.iosDeviceInfo.name
          : Global.androidDeviceInfo.brand,
    );
    _appUpdateInfo =
        await AppApi.update(context: context, params: requestDeviceInfo);

    _runAppUpdate();
  }

  /// 检查是否有新版
  Future _runAppUpdate() async {
    // 比较版本
    final isNewVersion =
        (_appUpdateInfo.latestVersion.compareTo(Global.packageInfo.version) ==
            1);

    // 安装
    if (isNewVersion == true) {
      _appUpdateConformDialog(() {
        Navigator.of(_context).pop();
        if (Global.isIOS == true) {
          // 去苹果店
          InstallPlugin.gotoAppStore(_appUpdateInfo.shopUrl);
        } else {
          // apk 下载安装
          toastInfo(msg: "开始下载升级包");
          _downloadAPKAndSetup(_appUpdateInfo.fileUrl);
        }
      });
    }
  }

  /// 下载文件 & 安装
  Future _downloadAPKAndSetup(String fileUrl) async {
    // 下载
    Directory externalDir = await getExternalStorageDirectory();
    String fullPath = externalDir.path + "/release.apk";

    Dio dio = Dio(BaseOptions(
        responseType: ResponseType.bytes,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        }));
    Response response = await dio.get(
      fileUrl,
    );

    File file = File(fullPath);
    var raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    // 安装
    await InstallPlugin.installApk(fullPath, Global.packageInfo.packageName);
  }

  /// 升级确认对话框
  void _appUpdateConformDialog(VoidCallback onPressed) {
    EasyDialog(
        title: Text(
          "发现新版本 ${_appUpdateInfo.latestVersion}",
          style: TextStyle(fontWeight: FontWeight.bold),
          textScaleFactor: 1.2,
        ),
        description: Text(
          _appUpdateInfo.latestDescription,
          textScaleFactor: 1.1,
          textAlign: TextAlign.center,
        ),
        height: 220,
        contentList: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new FlatButton(
                padding: const EdgeInsets.only(top: 8.0),
                textColor: Colors.lightBlue,
                onPressed: onPressed,
                child: new Text(
                  "同意",
                  textScaleFactor: 1.2,
                ),
              ),
              new FlatButton(
                padding: const EdgeInsets.only(top: 8.0),
                textColor: Colors.lightBlue,
                onPressed: () {
                  Navigator.of(_context).pop();
                },
                child: new Text(
                  "取消",
                  textScaleFactor: 1.2,
                ),
              ),
            ],
          )
        ]).show(_context);
  }
}
