//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<file_picker_darwin/FilePickerPlugin.h>)
#import <file_picker_darwin/FilePickerPlugin.h>
#else
@import file_picker_darwin;
#endif

#if __has_include(<flutter_litert/FlutterLitertPlugin.h>)
#import <flutter_litert/FlutterLitertPlugin.h>
#else
@import flutter_litert;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FilePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FilePickerPlugin"]];
  [FlutterLitertPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterLitertPlugin"]];
}

@end
