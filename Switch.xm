#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface ReduceMotionToggleSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" Boolean _AXSReduceMotionEnabled();
extern "C" void _AXSSetReduceMotionEnabled(BOOL enabled);

@implementation ReduceMotionToggleSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSReduceMotionEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetReduceMotionEnabled(newState == FSSwitchStateOn);
}

- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier
{
	NSURL *url = [NSURL URLWithString:(kCFCoreFoundationVersionNumber >= 1665.0f ? @"prefs:root=ACCESSIBILITY&path=MOTION_TITLE#REDUCE_MOTION_ID" : @"prefs:root=General&path=ACCESSIBILITY/REDUCE_MOTION")];
	[[FSSwitchPanel sharedPanel] openURLAsAlternateAction:url];
}

@end