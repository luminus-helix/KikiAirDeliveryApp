#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"
//#import Firebase;
@import Firebase;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
  //FIRApp.configure();
  //[FIRApp configure];

  //[FIRApp configure];
  [GMSServices provideAPIKey:@"AIzaSyDXDB3KCbtJ0SDS8sc5hE5N7pSroQ2Rbg0"];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
  //FirebaseApp.configure();
  //FIRApp.configure();

}

@end
