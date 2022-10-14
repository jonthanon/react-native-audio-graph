#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(AudioGraphViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(color, NSString)

RCT_EXPORT_VIEW_PROPERTY(title, NSString)
RCT_EXPORT_VIEW_PROPERTY(summary, NSString)
RCT_EXPORT_VIEW_PROPERTY(xTitle, NSString)
RCT_EXPORT_VIEW_PROPERTY(xValues, NSArray<NSNumber>)
RCT_EXPORT_VIEW_PROPERTY(yTitle, NSString)
RCT_EXPORT_VIEW_PROPERTY(yValues, NSArray<NSNumber>)

@end
