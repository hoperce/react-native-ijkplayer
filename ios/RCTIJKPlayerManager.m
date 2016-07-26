#import "RCTIJKPlayerManager.h"
#import "RCTIJKPlayer.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "RCTUtils.h"
#import "RCTLog.h"
#import "UIView+React.h"
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <ImageIO/ImageIO.h>

@interface RCTIJKPlayerManager ()

@end

@implementation RCTIJKPlayerManager

RCT_EXPORT_MODULE();

- (UIView *)viewWithProps:(__unused NSDictionary *)props
{
    return [self view];
}

- (UIView *)view
{
  self.rctijkplayer = [[RCTIJKPlayer alloc] initWithManager:self bridge:self.bridge];
  return self.rctijkplayer;
}

- (NSDictionary *)constantsToExport
{
  return @{
           };
}

- (NSArray *)customDirectEventTypes
{
    return @[
      @"LiveStateChange",
    ];
}

- (id)init {
  if ((self = [super init])) {
  }
  return self;
}


RCT_EXPORT_METHOD(start:(NSDictionary *)options
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject) {

  dispatch_async(dispatch_get_main_queue(), ^{
      NSString *pushURL = (NSString *)(options[@"push_url"]);
      NSLog(@"pushURL: %@", pushURL);
      [self.rctijkplayer startWithURL:pushURL];
    });
}

RCT_EXPORT_METHOD(stop) {
  dispatch_async(dispatch_get_main_queue(), ^{
    });
}


RCT_EXPORT_METHOD(mute) {
}

RCT_EXPORT_METHOD(resume) {
  dispatch_async(dispatch_get_main_queue(), ^{
    });
}

@end
