/********* rootPlugin.m Cordova Plugin Implementation *******/

#import "rootPlugin.h"


@implementation rootPlugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
    
- (void)detectRoot:(CDVInvokedUrlCommand *)command
{
    
    BOOL isJailBreak = [self jailBreak];
    
    if (isJailBreak) {
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"true"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }else{
         CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"false"];
         [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    
   
    
    
    
}
    
- (BOOL)jailBreak{
    NSArray *folderList = @[@"/Applications/Cydia.app",
                            @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                             //                                            "/bin/bash",
                             //                                            "/usr/sbin/sshd",
                            @"/etc/apt",
                            @"/usr/bin/ssh",
                       @"/private/var/lib/apt",
                       @"/private/var/lib/cydia",
                       @"/private/var/tmp/cydia.log",
                       @"/Applications/WinterBoard.app",
                       @"/var/lib/cydia",
                       @"/private/etc/dpkg/origins/debian",
                       @"/bin.sh",
                       @"/private/etc/apt",
                       @"/etc/ssh/sshd_config",
                       @"/private/etc/ssh/sshd_config",
                       @"/Applications/SBSetttings.app",
                       @"/private/var/mobileLibrary/SBSettingsThemes/",
                       @"/private/var/stash",
                       @"/usr/libexec/sftp-server",
                       @"/usr/libexec/cydia/",
                       @"/usr/sbin/frida-server",
                       @"/usr/bin/cycript",
                       @"/usr/local/bin/cycript",
                       @"/usr/lib/libcycript.dylib",
                       @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
                       @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
                       @"/Applications/FakeCarrier.app",
                       @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
                       @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
                       @"/usr/libexec/ssh-keysign",
                       @"/usr/libexec/sftp-server",
                       @"/Applications/blackra1n.app",
                       @"/Applications/IntelliScreen.app",
                       @"/Applications/Snoop-itConfig.app",
                       @"/var/checkra1n.dmg",
                       @"/var/binpack"];
    
    for (NSString *folderPath in folderList) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
            
            return YES;
        }
    }
    
    
    return NO;
}

- (void)exitProgress :(CDVInvokedUrlCommand*)command{
    exit(0);
}

@end
