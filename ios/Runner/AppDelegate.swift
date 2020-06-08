import UIKit
import Flutter
import Sentry

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    SentrySDK.start(options: [
        "dsn": "https://46df062f08f64573b6a2a84b787b25cc@o402094.ingest.sentry.io/5265498",
        "debug": true, // Enabled debug when first installing is always helpful
        "enableAutoSessionTracking": true
    ])
    
    NSSetUncaughtExceptionHandler { exception in
     print(exception)
     SentrySDK.capture(message: exception.description)
     SentrySDK.capture(exception: exception)
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
  }
}
