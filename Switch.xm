#import <Foundation/Foundation.h>
#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>
#import <version.h>

@interface ReduceMotionSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" Boolean _AXSReduceMotionEnabled();
extern "C" void _AXSSetReduceMotionEnabled(BOOL enabled);

@implementation ReduceMotionSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	return _AXSReduceMotionEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetReduceMotionEnabled(newState == FSSwitchStateOn);
}

- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier {
	NSURL *url = [NSURL URLWithString:IS_IOS_OR_NEWER(iOS_13_0) ? @"prefs:root=ACCESSIBILITY&path=MOTION_TITLE#REDUCE_MOTION_ID" : @"prefs:root=General&path=ACCESSIBILITY/REDUCE_MOTION"];
	[[FSSwitchPanel sharedPanel] openURLAsAlternateAction:url];
}

@end