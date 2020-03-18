#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  [GeneratedPluginRegistrant registerWithRegistry:self];
  [GMSServices provideAPIKey:@"{{AIzaSyAQsmERuXEy0dkpb1OfaWabs4GGpqJNXKU}}"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
