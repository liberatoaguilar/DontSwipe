#import <libactivator/libactivator.h>
#import <AudioToolbox/AudioServices.h>
#import <UIKit/UIKit.h>
extern UIWindow *window;
UIWindow *window = nil;
extern UIWindow *nomore;
UIWindow *nomore = nil;
extern UIWindow *border;
UIWindow *border = nil;
extern UIWindow *borderLeft;
UIWindow *borderLeft = nil;
extern UIWindow *borderRight;
UIWindow *borderRight = nil;
extern UIWindow *borderBottom;
UIWindow *borderBottom = nil;
extern UIImageView *dot;
UIImageView *dot = nil;
extern bool done;
bool done = NO;
extern bool logging;
bool logging = NO;
extern bool enableNotifs;
bool enableNotifs = NO;
extern bool enableSwipes;
bool enableSwipes = NO;
extern bool animsfinished;
bool animsfinished = NO;


@interface SBOrientationLockManager
+(SBOrientationLockManager *)sharedInstance;
-(bool)isUserLocked;
-(void)lock;
-(void)unlock;
@end
@interface CallNow : NSObject<LAListener>
{}
@end
@implementation CallNow

-(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.secondeight.dontswipe.plist"];

    logging = [settings objectForKey:@"AwesomeSwitch1"] ? [[settings objectForKey:@"AwesomeSwitch1"] boolValue] : NO;
    enableSwipes = [settings objectForKey:@"AwesomeSwitch3"] ? [[settings objectForKey:@"AwesomeSwitch3"] boolValue] : NO;
    if (!window){

      //Rotation Lock
      if (!enableSwipes) {
        [[%c(SBOrientationLockManager) sharedInstance] performSelector:@selector(lock)];
      }

      if ([UIScreen mainScreen].bounds.size.height < [UIScreen mainScreen].bounds.size.width) {

          NSLog(@"Listener Accepted");

          window = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width)];
          window.hidden = NO;
          window.windowLevel = 3000;
          window.layer.masksToBounds = YES;
          window.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.4f];
          [window setAlpha:0.0f];
          AudioServicesPlaySystemSound(1519);
          done = YES;
          [UIView animateWithDuration:0.5f animations:^{

            [window setAlpha:1.0f];
            window.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width);

          } completion:nil];


          [UIView animateWithDuration:0.5f animations:^{

                [window setAlpha:0.1f];
                window.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width);
                window.backgroundColor = [[UIColor clearColor]colorWithAlphaComponent:0.1f];

            } completion:^(BOOL animsfinished){
              if (enableSwipes){
                window.hidden = YES;
              }
            }];


            if (logging){

              if ([UIScreen mainScreen].bounds.size.width == 812) {

                UIImage* top_left = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_top_left.png"];
                UIImageView *top_left_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(0,0,40,40)] autorelease] initWithImage:top_left];
                UIWindow *top_left_window = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,40,40)];
                top_left_window.hidden = NO;
                top_left_window.windowLevel = 3001;
                top_left_window.layer.masksToBounds = YES;
                top_left_window.layer.cornerRadius = 0;
                [top_left_window setAlpha:1.0f];
                [top_left_window addSubview:top_left_imageview];
                UIImage* top_left_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_top_left_border.png"];
                UIImageView *top_left_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(0,40,37,1.3f)] autorelease] initWithImage:top_left_border];
                UIWindow *top_left_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(0,40,37,1.3f)];
                top_left_border_window.hidden = NO;
                top_left_border_window.windowLevel = 3001;
                top_left_border_window.layer.masksToBounds = YES;
                top_left_border_window.layer.cornerRadius = 0;
                [top_left_border_window setAlpha:1.0f];
                [top_left_border_window addSubview:top_left_border_imageview];
                UIImage* notch = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_notch.png"];
                UIImageView *notch_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(0,77,221,31.6f)] autorelease] initWithImage:notch];
                UIWindow *notch_window = [[UIWindow alloc]initWithFrame:CGRectMake(0,77,221,31.6f)];
                notch_window.hidden = NO;
                notch_window.windowLevel = 3001;
                notch_window.layer.masksToBounds = YES;
                notch_window.layer.cornerRadius = 0;
                [notch_window setAlpha:1.0f];
                [notch_window addSubview:notch_imageview];
                UIImage* top_right_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_top_right_border.png"];
                UIImageView *top_right_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(0,298,37,1.3f)] autorelease] initWithImage:top_right_border];
                UIWindow *top_right_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(0,298,37,1.3f)];
                top_right_border_window.hidden = NO;
                top_right_border_window.windowLevel = 3001;
                top_right_border_window.layer.masksToBounds = YES;
                top_right_border_window.layer.cornerRadius = 0;
                [top_right_border_window setAlpha:1.0f];
                [top_right_border_window addSubview:top_right_border_imageview];
                UIImage* top_right = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_top_right.png"];
                UIImageView *top_right_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(0,335,40,40)] autorelease] initWithImage:top_right];
                UIWindow *top_right_window = [[UIWindow alloc]initWithFrame:CGRectMake(0,335,40,40)];
                top_right_window.hidden = NO;
                top_right_window.windowLevel = 3001;
                top_right_window.layer.masksToBounds = YES;
                top_right_window.layer.cornerRadius = 0;
                [top_right_window setAlpha:1.0f];
                [top_right_window addSubview:top_right_imageview];
                UIImage* left_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_left_border.png"];
                UIImageView *left_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(40,0,1.6f,732)] autorelease] initWithImage:left_border];
                UIWindow *left_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(40,0,1.6f,732)];
                left_border_window.hidden = NO;
                left_border_window.windowLevel = 3001;
                left_border_window.layer.masksToBounds = YES;
                left_border_window.layer.cornerRadius = 0;
                [left_border_window setAlpha:1.0f];
                [left_border_window addSubview:left_border_imageview];
                UIImage* right_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_right_border.png"];
                UIImageView *right_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(40,373.3f,1.6f,732)] autorelease] initWithImage:right_border];
                UIWindow *right_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(40,373.3f,1.6f,732)];
                right_border_window.hidden = NO;
                right_border_window.windowLevel = 3001;
                right_border_window.layer.masksToBounds = YES;
                right_border_window.layer.cornerRadius = 0;
                [right_border_window setAlpha:1.0f];
                [right_border_window addSubview:right_border_imageview];
                UIImage* bottom_left = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_bottom_left.png"];
                UIImageView *bottom_left_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(0,772,40,40)] autorelease] initWithImage:bottom_left];
                UIWindow *bottom_left_window = [[UIWindow alloc]initWithFrame:CGRectMake(0,772,40,40)];
                bottom_left_window.hidden = NO;
                bottom_left_window.windowLevel = 3001;
                bottom_left_window.layer.masksToBounds = YES;
                bottom_left_window.layer.cornerRadius = 0;
                [bottom_left_window setAlpha:1.0f];
                [bottom_left_window addSubview:bottom_left_imageview];
                UIImage* bottom_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_bottom_border.png"];
                UIImageView *bottom_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(40,810.3f,295,1.3f)] autorelease] initWithImage:bottom_border];
                UIWindow *bottom_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(40,810.3f,295,1.3f)];
                bottom_border_window.hidden = NO;
                bottom_border_window.windowLevel = 3001;
                bottom_border_window.layer.masksToBounds = YES;
                bottom_border_window.layer.cornerRadius = 0;
                [bottom_border_window setAlpha:1.0f];
                [bottom_border_window addSubview:bottom_border_imageview];
                UIImage* bottom_right = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_bottom_right.png"];
                UIImageView *bottom_right_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(335,772,40,40)] autorelease] initWithImage:bottom_right];
                UIWindow *bottom_right_window = [[UIWindow alloc]initWithFrame:CGRectMake(335,772,40,40)];
                bottom_right_window.hidden = NO;
                bottom_right_window.windowLevel = 3001;
                bottom_right_window.layer.masksToBounds = YES;
                bottom_right_window.layer.cornerRadius = 0;
                [bottom_right_window setAlpha:1.0f];
                [bottom_right_window addSubview:bottom_right_imageview];

              }
              else {
                //Top Border
                border = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.height,1)];
                border.hidden = NO;
                border.windowLevel = 3001;
                border.layer.masksToBounds = YES;
                border.layer.cornerRadius = 0;
                border.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0f];
                [border setAlpha:1.0f];
                //Left Border
                borderLeft = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,1,[UIScreen mainScreen].bounds.size.width)];
                borderLeft.hidden = NO;
                borderLeft.windowLevel = 3001;
                borderLeft.layer.masksToBounds = YES;
                borderLeft.layer.cornerRadius = 0;
                borderLeft.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0f];
                [borderLeft setAlpha:1.0f];
                //Right Border
                borderRight = [[UIWindow alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.height-1,0,1,[UIScreen mainScreen].bounds.size.width)];
                borderRight.hidden = NO;
                borderRight.windowLevel = 3001;
                borderRight.layer.masksToBounds = YES;
                borderRight.layer.cornerRadius = 0;
                borderRight.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0f];
                [borderRight setAlpha:1.0f];
                //Bottom Border
                borderBottom = [[UIWindow alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.width-1,[UIScreen mainScreen].bounds.size.height,1)];
                borderBottom.hidden = NO;
                borderBottom.windowLevel = 3001;
                borderBottom.layer.masksToBounds = YES;
                borderBottom.layer.cornerRadius = 0;
                borderBottom.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0f];
                [borderBottom setAlpha:1.0f];
              }
            }

      }
      else {

        NSLog(@"Listener Accepted");

        window = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
        window.hidden = NO;
        window.windowLevel = 3000;
        window.layer.masksToBounds = YES;
        window.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.4f];
        [window setAlpha:0.0f];
        AudioServicesPlaySystemSound(1519);
        done = YES;
        [UIView animateWithDuration:0.5f animations:^{

          [window setAlpha:1.0f];
          window.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);

        } completion:nil];


        [UIView animateWithDuration:0.5f animations:^{

              [window setAlpha:0.1f];
              window.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
              window.backgroundColor = [[UIColor clearColor]colorWithAlphaComponent:0.1f];

          } completion:^(BOOL animsfinished){
            if (enableSwipes){
              window.hidden = YES;
            }
          }];


          if (logging){
            if ([UIScreen mainScreen].bounds.size.height == 812) {

              UIImage* top_left = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_top_left.png"];
              UIImageView *top_left_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(0,0,40,40)] autorelease] initWithImage:top_left];
              UIWindow *top_left_window = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,40,40)];
              top_left_window.hidden = NO;
              top_left_window.windowLevel = 3001;
              top_left_window.layer.masksToBounds = YES;
              top_left_window.layer.cornerRadius = 0;
              [top_left_window setAlpha:1.0f];
              [top_left_window addSubview:top_left_imageview];
              UIImage* top_left_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_top_left_border.png"];
              UIImageView *top_left_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(40,0,37,1.3f)] autorelease] initWithImage:top_left_border];
              UIWindow *top_left_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(40,0,37,1.3f)];
              top_left_border_window.hidden = NO;
              top_left_border_window.windowLevel = 3001;
              top_left_border_window.layer.masksToBounds = YES;
              top_left_border_window.layer.cornerRadius = 0;
              [top_left_border_window setAlpha:1.0f];
              top_left_border_window.backgroundColor = [UIColor redColor];
              [top_left_border_window addSubview:top_left_border_imageview];
              UIImage* notch = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_notch.png"];
              UIImageView *notch_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(77,0,221,31.6f)] autorelease] initWithImage:notch];
              UIWindow *notch_window = [[UIWindow alloc]initWithFrame:CGRectMake(77,0,221,31.6f)];
              notch_window.hidden = NO;
              notch_window.windowLevel = 3001;
              notch_window.layer.masksToBounds = YES;
              notch_window.layer.cornerRadius = 0;
              [notch_window setAlpha:1.0f];
              notch_window.backgroundColor = [UIColor redColor];
              [notch_window addSubview:notch_imageview];
              UIImage* top_right_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_top_right_border.png"];
              UIImageView *top_right_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(298,0,37,1.3f)] autorelease] initWithImage:top_right_border];
              UIWindow *top_right_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(298,0,37,1.3f)];
              top_right_border_window.hidden = NO;
              top_right_border_window.windowLevel = 3001;
              top_right_border_window.layer.masksToBounds = YES;
              top_right_border_window.layer.cornerRadius = 0;
              [top_right_border_window setAlpha:1.0f];
              top_right_border_window.backgroundColor = [UIColor redColor];
              [top_right_border_window addSubview:top_right_border_imageview];
              UIImage* top_right = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_top_right.png"];
              UIImageView *top_right_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(335,0,40,40)] autorelease] initWithImage:top_right];
              UIWindow *top_right_window = [[UIWindow alloc]initWithFrame:CGRectMake(335,0,40,40)];
              top_right_window.hidden = NO;
              top_right_window.windowLevel = 3001;
              top_right_window.layer.masksToBounds = YES;
              top_right_window.layer.cornerRadius = 0;
              [top_right_window setAlpha:0.5f];
              top_right_window.backgroundColor = [UIColor blueColor];
              [top_right_window addSubview:top_right_imageview];
              UIImage* left_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_left_border.png"];
              UIImageView *left_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(0,40,1.6f,732)] autorelease] initWithImage:left_border];
              UIWindow *left_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(0,40,1.6f,732)];
              left_border_window.hidden = NO;
              left_border_window.windowLevel = 3001;
              left_border_window.layer.masksToBounds = YES;
              left_border_window.layer.cornerRadius = 0;
              [left_border_window setAlpha:1.0f];
              left_border_window.backgroundColor = [UIColor redColor];
              [left_border_window addSubview:left_border_imageview];
              UIImage* right_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_right_border.png"];
              UIImageView *right_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(373.3f,40,1.6f,732)] autorelease] initWithImage:right_border];
              UIWindow *right_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(373.3f,40,1.6f,732)];
              right_border_window.hidden = NO;
              right_border_window.windowLevel = 3001;
              right_border_window.layer.masksToBounds = YES;
              right_border_window.layer.cornerRadius = 0;
              [right_border_window setAlpha:1.0f];
              right_border_window.backgroundColor = [UIColor redColor];
              [right_border_window addSubview:right_border_imageview];
              UIImage* bottom_left = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_bottom_left.png"];
              UIImageView *bottom_left_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(772,0,40,40)] autorelease] initWithImage:bottom_left];
              UIWindow *bottom_left_window = [[UIWindow alloc]initWithFrame:CGRectMake(772,0,40,40)];
              bottom_left_window.hidden = NO;
              bottom_left_window.windowLevel = 3001;
              bottom_left_window.layer.masksToBounds = YES;
              bottom_left_window.layer.cornerRadius = 0;
              [bottom_left_window setAlpha:1.0f];
              bottom_left_window.backgroundColor = [UIColor redColor];
              [bottom_left_window addSubview:bottom_left_imageview];
              UIImage* bottom_border = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_bottom_border.png"];
              UIImageView *bottom_border_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(810.3f,40,295,1.3f)] autorelease] initWithImage:bottom_border];
              UIWindow *bottom_border_window = [[UIWindow alloc]initWithFrame:CGRectMake(810.3f,40,295,1.3f)];
              bottom_border_window.hidden = NO;
              bottom_border_window.windowLevel = 3001;
              bottom_border_window.layer.masksToBounds = YES;
              bottom_border_window.layer.cornerRadius = 0;
              [bottom_border_window setAlpha:1.0f];
              bottom_border_window.backgroundColor = [UIColor redColor];
              [bottom_border_window addSubview:bottom_border_imageview];
              UIImage* bottom_right = [UIImage imageWithContentsOfFile:@"/var/mobile/icon/image_bottom_right.png"];
              UIImageView *bottom_right_imageview = [[[[UIImageView alloc] initWithFrame:CGRectMake(772,335,40,40)] autorelease] initWithImage:bottom_right];
              UIWindow *bottom_right_window = [[UIWindow alloc]initWithFrame:CGRectMake(772,335,40,40)];
              bottom_right_window.hidden = NO;
              bottom_right_window.windowLevel = 3001;
              bottom_right_window.layer.masksToBounds = YES;
              bottom_right_window.layer.cornerRadius = 0;
              [bottom_right_window setAlpha:1.0f];
              bottom_right_window.backgroundColor = [UIColor redColor];
              [bottom_right_window addSubview:bottom_right_imageview];

            }
            else {
              //Top Border
              border = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,1)];
              border.hidden = NO;
              border.windowLevel = 3001;
              border.layer.masksToBounds = YES;
              border.layer.cornerRadius = 0;
              border.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0f];
              [border setAlpha:1.0f];
              //Left Border
              borderLeft = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,1,[UIScreen mainScreen].bounds.size.height)];
              borderLeft.hidden = NO;
              borderLeft.windowLevel = 3001;
              borderLeft.layer.masksToBounds = YES;
              borderLeft.layer.cornerRadius = 0;
              borderLeft.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0f];
              [borderLeft setAlpha:1.0f];
              //Right Border
              borderRight = [[UIWindow alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-1,0,1,[UIScreen mainScreen].bounds.size.height)];
              borderRight.hidden = NO;
              borderRight.windowLevel = 3001;
              borderRight.layer.masksToBounds = YES;
              borderRight.layer.cornerRadius = 0;
              borderRight.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0f];
              [borderRight setAlpha:1.0f];
              //Bottom Border
              borderBottom = [[UIWindow alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-1,[UIScreen mainScreen].bounds.size.width,1)];
              borderBottom.hidden = NO;
              borderBottom.windowLevel = 3001;
              borderBottom.layer.masksToBounds = YES;
              borderBottom.layer.cornerRadius = 0;
              borderBottom.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0f];
              [borderBottom setAlpha:1.0f];
            }
          }
      }
    }

    else {
      // Rotation Lock
      if (!enableSwipes) {
        [[%c(SBOrientationLockManager) sharedInstance] performSelector:@selector(unlock)];
      }


      if ([UIScreen mainScreen].bounds.size.height < [UIScreen mainScreen].bounds.size.width) {
          // run this code
          nomore = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width)];
          nomore.hidden = NO;
          nomore.windowLevel = 3000;//UIWindowLevelStatusBar;
          nomore.layer.masksToBounds = YES;
          nomore.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.4f];
          [nomore setAlpha:0.0f];
          window.hidden = YES;
          window = nil;
          if ([UIScreen mainScreen].bounds.size.height == 812) {
            dot.hidden = YES;
            dot = nil;
            border.hidden = YES;
            border = nil;
          }
          else {
            border.hidden = YES;
            border = nil;
            borderLeft.hidden = YES;
            borderLeft = nil;
            borderRight.hidden = YES;
            borderRight = nil;
            borderBottom.hidden = YES;
            borderBottom = nil;
          }
          done = NO;
          AudioServicesPlaySystemSound(1519);
          //AirplaneMode

          //End
          [UIView animateWithDuration:0.5f animations:^{

                [nomore setAlpha:1.0f];
                nomore.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width);

          } completion:nil];


          [UIView animateWithDuration:0.5f animations:^{

                [nomore setAlpha:0.1f];
                nomore.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width);
                nomore.backgroundColor = [[UIColor clearColor]colorWithAlphaComponent:0.1f];

          } completion:nil];
          //nomore.hidden = YES;
          [nomore setAlpha:0.0f];
          nomore = nil;

      }
      else {
          // run this code
          nomore = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
          nomore.hidden = NO;
          nomore.windowLevel = 3000;//UIWindowLevelStatusBar;
          nomore.layer.masksToBounds = YES;
          nomore.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.4f];
          [nomore setAlpha:0.0f];
          window.hidden = YES;
          window = nil;
          if ([UIScreen mainScreen].bounds.size.height == 812) {
            dot.hidden = YES;
            dot = nil;
            border.hidden = YES;
            border = nil;
          }
          else {
            border.hidden = YES;
            border = nil;
            borderLeft.hidden = YES;
            borderLeft = nil;
            borderRight.hidden = YES;
            borderRight = nil;
            borderBottom.hidden = YES;
            borderBottom = nil;
          }
          done = NO;
          AudioServicesPlaySystemSound(1519);
          //AirplaneMode

          //End
          [UIView animateWithDuration:0.5f animations:^{

                [nomore setAlpha:1.0f];
                nomore.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);

          } completion:nil];


          [UIView animateWithDuration:0.5f animations:^{

                [nomore setAlpha:0.1f];
                nomore.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
                nomore.backgroundColor = [[UIColor clearColor]colorWithAlphaComponent:0.1f];

          } completion:nil];
          //nomore.hidden = YES;
          [nomore setAlpha:0.0f];
          nomore = nil;
        }

      }



    }

+(void)load {
	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"DontSwipe"];
	[p release];
}

@end
%hook SBHomeHardwareButtonActions
-(BOOL)_shouldIgnorePressesDueToProxOrIdle:(id*)arg1 {
  return done;
}
%end
%hook SBLockHardwareButtonActions
-(void)performSinglePressAction{
  if (!done) {
    %orig;
  }
}
-(void)performDoublePressAction{
  if (!done) {
    %orig;
  }
}
-(void)performTriplePressAction{
  if (!done) {
    %orig;
  }
}
%end
%hook SBVolumeHardwareButtonActions
-(void)volumeIncreasePressDown{
  if (!done) {
    %orig;
  }
}
-(void)volumeIncreasePressUp{
  if (!done) {
    %orig;
  }
}
-(void)volumeDecreasePressDown{
  if (!done) {
    %orig;
  }
}
-(void)volumeDecreasePressUp{
  if (!done) {
    %orig;
  }
}
%end
%hook SBCoverSheetSlidingViewController
-(void)_handlePresentGesture:(id)arg1 {
  if (!done) {
    %orig;
  }
}
-(void)_handleDismissGesture:(id)arg1 {
  if (!done) {
    %orig;
  }
}
%end
%hook SBControlCenterController
-(void)grabberTongueBeganPulling:(id)arg1 withDistance:(double)arg2 andVelocity:(double)arg3 {
  if (!done) {
    %orig;
  }
}
%end
%hook SBReachabilityManager
-(void)_handleReachabilityActivated {
  if (!done) {
    %orig;
  }
}
%end
%hook SBFluidSwitcherGestureManager
-(void)grabberTongueBeganPulling:(id)arg1 withDistance:(double)arg2 andVelocity:(double)arg3 {
  if (!done) {
    %orig;
  }
}
%end
%hook SBNotificationBannerDestination
-(void)notificationViewControllerIsReadyToBePresented:(id)arg1 {
  NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.secondeight.dontswipe.plist"];

  enableNotifs = [settings objectForKey:@"AwesomeSwitch2"] ? [[settings objectForKey:@"AwesomeSwitch2"] boolValue] : NO;
  if (enableNotifs){
    if (!done) {
      %orig;
    }
  }
}
-(BOOL)_isQuietModeEnabledAndActive {
  NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.secondeight.dontswipe.plist"];

  enableNotifs = [settings objectForKey:@"AwesomeSwitch2"] ? [[settings objectForKey:@"AwesomeSwitch2"] boolValue] : NO;
  if (enableNotifs){
    if (!done) {
      return %orig;
    }
    else {
      return YES;
    }
  }
  else  {
    return %orig;
  }
}
%end
%hook SBOrientationLockManager
-(void)unlock{
    %orig;
}
-(void)lock{
    %orig;
}
%end
