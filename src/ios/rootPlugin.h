/********* rootPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface rootPlugin : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)detectRoot:(CDVInvokedUrlCommand*)command;
- (void)exitProgress:(CDVInvokedUrlCommand*)command;
    
    
@end
