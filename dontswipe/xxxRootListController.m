#include "xxxRootListController.h"
@interface PSTableCell : UITableViewCell
@end
@interface PSControlTableCell : PSTableCell
- (UIControl *)control;
@end
@interface PSSwitchTableCell : PSControlTableCell
- (id)initWithStyle:(int)style reuseIdentifier:(id)identifier specifier:(id)specifier;
@end

@interface SRSwitchTableCell : PSSwitchTableCell
@end

@implementation SRSwitchTableCell

-(id)initWithStyle:(int)style reuseIdentifier:(id)identifier specifier:(id)specifier { //init method
	self = [super initWithStyle:style reuseIdentifier:identifier specifier:specifier]; //call the super init method
	if (self) {
		[((UISwitch *)[self control]) setOnTintColor:[UIColor colorWithRed:0.24 green:0.35 blue:0.65 alpha:1.0]]; //change the switch color
	}
	return self;
}

@end

//https://github.com/libpd/pd-for-ios/issues/19 Mariusjcb fix for system();

#include <spawn.h>

extern char **environ;

void run_cmd(char *cmd)
{
    pid_t pid;
    char *argv[] = {"sh", "-c", cmd, NULL};
    int status;

    status = posix_spawn(&pid, "/bin/sh", NULL, NULL, argv, environ);
    if (status == 0) {
        if (waitpid(pid, &status, 0) == -1) {
            perror("waitpid");
        }
    }
}

@implementation xxxRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void) contactMethod {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/SecondEight1/"] options:@{} completionHandler:nil];
}

-(void) donationMethod {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.paypal.me/LiberatoAguilar"] options:@{} completionHandler:nil];
}

-(void) emailMethod {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"mailto:liberatoalanaguilar@gmail.com"] options:@{} completionHandler:nil];
}

- (void) respringboi {

	run_cmd("killall -9 SpringBoard");
}
@end
