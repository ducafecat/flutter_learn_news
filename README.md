# Flutter 新闻客户端

## 项目目标

通过新闻 APP 业务构建一套精简的代码模板。

## SDK 环境

```
Flutter 1.17.2 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 5f21edf8b6 (4 days ago) • 2020-05-28 12:44:12 -0700
Engine • revision b851c71829
Tools • Dart 2.8.3
```

## 界面适配 IOS、Android

| IOS                                          | Android                                              |
| -------------------------------------------- | ---------------------------------------------------- |
| ![ios-features](doc/images/ios-features.png) | ![android-features](doc/images/android-features.png) |
| ![ios-login](doc/images/ios-login.png)       | ![android-login](doc/images/android-login.png)       |
| ![ios-signup](doc/images/ios-signup.png)     | ![android-signup](doc/images/android-signup.png)     |
| ![ios-index](doc/images/ios-index.png)       | ![android-index](doc/images/android-index.png)       |
| ![ios-details](doc/images/ios-details.png)   | ![android-details](doc/images/android-details.png)   |

## 技术点

![technical](doc/images/technical.png)

## 目录结构

![configuration](doc/images/configuration.png)

## dependencies 依赖包

| 名称                 | 说明         |
| -------------------- | ------------ |
| auto_route           | 路由管理     |
| intl                 | 日期格式     |
| flutter_screenutil   | 屏幕适配     |
| flutter_easyrefresh  | 上下拉刷新   |
| pk_skeleton          | 骨架屏       |
| fluttertoast         | 提示 toast   |
| dio                  | 通讯 http    |
| cookie_jar           | cookie       |
| dio_cookie_manager   | dio cookie   |
| shared_preferences   | 本地存储     |
| cached_network_image | 图片缓存     |
| crypto               | 加密 SHA     |
| provider             | 响应数据     |
| webview_flutter      | web 显示     |
| loading_animations   | loading 动画 |
| share                | 分享         |
| auto_route_generator | 自动路由     |
| build_runner         | 路由代码生成 |

## 功能

- [x] 欢迎界面
- [x] 登录界面
- [x] 注册界面
- [x] 首页
- [ ] 分类页
- [ ] 搜索页
- [x] 详情页

## 导入 iconfont 图标库

```
iconfont_builder --from ./assets/fonts --to ./lib/common/utils/iconfont.dart
```

## 生成路由

```
flutter packages pub run build_runner build
```

## 代码仓

https://github.com/ducafecat/flutter_learn_news

## 接口管理

- 管理
  http://yapi.demo.qunar.com/

- 接口地址
  http://yapi.demo.qunar.com/mock/88171

## 蓝湖设计稿

https://lanhuapp.com/url/lYuz1

密码: gSKl

> 由于设计稿有版权，不方便提供下载，需要的联系我微信添加蓝湖授权

## 视频

- [B 站](https://space.bilibili.com/404904528/channel/detail?cid=106755)
- [油管镜像](https://www.youtube.com/watch?v=Uucg6GGGBsY&list=PL274L1n86T80VZR30KaLOKV6jqwTq5E8D)

## 联系

微信号: ducafecat
