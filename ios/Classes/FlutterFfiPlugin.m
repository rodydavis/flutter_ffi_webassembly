#import "FlutterFfiPlugin.h"
#if __has_include(<flutter_ffi_plugin/flutter_ffi_plugin-Swift.h>)
#import <flutter_ffi_plugin/flutter_ffi_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_ffi_plugin-Swift.h"
#endif

@implementation FlutterFfiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterFfiPlugin registerWithRegistrar:registrar];
}
@end
