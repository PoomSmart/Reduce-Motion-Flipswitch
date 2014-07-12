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

@end