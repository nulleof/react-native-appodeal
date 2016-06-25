#import "Appodeal.h"

@implementation Appodeal

RCT_EXPORT_MODULE()
//RCT_EXPORT_MODULE(Appodeal) //they are equal

RCT_EXPORT_METHOD(debug:(NSString *) message) {
    RCTLogInfo(@"debug method was called for message %@", message);
    NSLog(@"NSLog for message %@", message);
}

@end
