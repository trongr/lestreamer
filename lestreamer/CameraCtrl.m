//
//  Camera.m
//  lestreamer
//
//  Created by Michael T on 2015-05-11.
//  Copyright (c) 2015 devgruxcon. All rights reserved.
//

#import "VCSimpleSession.h"
#import "CameraCtrl.h"

@interface CameraCtrl () <VCSessionDelegate>
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *streamButton;
@property (nonatomic, retain) VCSimpleSession* session;
@end

@implementation CameraCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildInterface];
}

- (void) buildInterface
{
    [self addOrientationChangeListener];
    [self makeCamPreview];
    [self.previewView addSubview:[self getCloseButton]];
    [self.previewView addSubview:[self getStreamButton]];
}

-(void)addOrientationChangeListener {
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
}

- (void) orientationChanged:(NSNotification *)note
{
    [self recalStreamButtonPosition];
}

-(void)makeCamPreview {
    // TODO how do you get rid of the black bars in the preview?
    CGSize videoSize = CGSizeMake(1280, 720);
    _session = [[VCSimpleSession alloc] initWithVideoSize:videoSize frameRate:30 bitrate:1000000 useInterfaceOrientation:YES];
    [self.previewView addSubview:_session.previewView];
    _session.previewView.frame = self.previewView.bounds;
    _session.delegate = self;
}

- (UIButton *) getCloseButton
{
    if ( !_closeButton ) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setBackgroundColor:[UIColor redColor]];
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_closeButton setFrame:(CGRect){ 30, 30, 30, 30 }];
        [_closeButton addTarget:self action:@selector(closeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (UIButton *) getStreamButton
{
    if ( !_streamButton ) {
        _streamButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_streamButton setBackgroundColor:self.previewView.tintColor];
        //        TODO set image in cameraViewStartRecording to show different streaming states
        [_streamButton setImage:[UIImage imageNamed:@"stream"] forState:UIControlStateNormal];
        [_streamButton setFrame:(CGRect){ 0, 0, 66, 66 }];
        [_streamButton.layer setCornerRadius:33.0f];
        [_streamButton addTarget:self action:@selector(streamButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self recalStreamButtonPosition];
    return _streamButton;
}

-(void)recalStreamButtonPosition {
    [_streamButton setCenter:(CGPoint){ CGRectGetMidX(self.view.bounds), CGRectGetHeight(self.view.bounds) - 100 }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)streamButton:(id)sender {
    switch(_session.rtmpSessionState) {
        case VCSessionStateNone:
        case VCSessionStatePreviewStarted:
        case VCSessionStateEnded:
        case VCSessionStateError:
            [_session startRtmpSessionWithURL:@"rtmp://192.168.2.11:1935/test" andStreamKey:@"myStream"]; // wowza IP
            break;
        default:
            [_session endRtmpSession];
            break;
    }
    // todo use this to authenticate with wowza. you'll need to change VideoCore's source.
    // see videocore.test
//    switch(_session.rtmpSessionState) {
//        case VCSessionStateNone:
//        case VCSessionStatePreviewStarted:
//        case VCSessionStateEnded:
//        case VCSessionStateError:
//            [_session startRtmpSessionWithURL:@"rtmp://stream.server.com:1935"
//                                        query:@"live?password=suppah"
//                                   streamname:@"flv:blah"];
//            break;
//        default:
//            [_session endRtmpSession];
//            break;
//    }
}

- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) connectionStatusChanged:(VCSessionState) state
{
    // TODO set button images
//    switch(state) {
//        case VCSessionStateStarting:
//            [self.btnConnect setTitle:@"Connecting" forState:UIControlStateNormal];
//            break;
//        case VCSessionStateStarted:
//            [self.btnConnect setTitle:@"Disconnect" forState:UIControlStateNormal];
//            break;
//        default:
//            [self.btnConnect setTitle:@"Connect" forState:UIControlStateNormal];
//            break;
//    }
}

@end
