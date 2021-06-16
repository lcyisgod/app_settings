#import "AppSettingsPlugin.h"

@implementation AppSettingsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"app_settings"
            binaryMessenger:[registrar messenger]];
  AppSettingsPlugin* instance = [[AppSettingsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSURL *url= [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
    if (@available(iOS 10.0, *)) {
        if( [[UIApplication sharedApplication]canOpenURL:url] ) {
         [[UIApplication sharedApplication]openURL:url];
        }
    } else {
        if([[UIApplication sharedApplication]canOpenURL:url] ) {
            [[UIApplication sharedApplication]openURL:url options:@{}completionHandler:nil];
        }
    }
}

@end
