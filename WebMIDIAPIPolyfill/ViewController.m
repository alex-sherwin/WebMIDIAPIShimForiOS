/*
 
 Copyright 2014 Takashi Mizuhiki
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 */

#import "ViewController.h"
#import "WebViewDelegate.h"
#import "MIDIDriver.h"

//#import <CoreMIDI/MIDINetworkSession.h>



@interface ViewController ()
@property (nonatomic, strong) MIDIDriver *midiDriver;
@end

@implementation ViewController

- (void)loadURL:(NSURL *)url
{
    // Load URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

#pragma mark -
#pragma mark View action handlers

- (void)onEditingDidEnd:(UITextField *)field
{
    [self loadURL:[NSURL URLWithString:field.text]];
}


#pragma mark -
#pragma mark View initializers

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    MIDINetworkSession* session = [MIDINetworkSession defaultSession];
//    session.enabled = YES;
//    session.connectionPolicy = MIDINetworkConnectionPolicy_Anyone;


    _midiDriver = [[MIDIDriver alloc] init];
    WKWebViewConfiguration *configuration = [MIDIWebView createConfigurationWithMIDIDriver:_midiDriver sysexConfirmation:^(NSString *url) { return YES; }];
    
    configuration.websiteDataStore = [WKWebsiteDataStore defaultDataStore];


    MIDIWebView *webView = [[MIDIWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
    
    [self.navigationController setNavigationBarHidden:YES animated:FALSE];
    
    [self.view addSubview:webView];
    
    
    

    // Create a URL input field on the navigation bar
//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
//    [textField setBorderStyle:UITextBorderStyleRoundedRect];
//    [textField setPlaceholder:@"Enter URL"];
//    [textField addTarget:self action:@selector(onEditingDidEnd:) forControlEvents:UIControlEventEditingDidEndOnExit];
//    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
//    [textField setKeyboardType:UIKeyboardTypeURL];
//    [textField setReturnKeyType:UIReturnKeyGo];
//    [textField setClearButtonMode:UITextFieldViewModeWhileEditing];
//    self.navigationItem.titleView = textField;

    self.webView = webView;

    // Open sample HTML file at bundle path
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"dist"];
//    NSString *path = @"file:///dist/index.html";
//    NSString *readPath = @"file:/dist";
    
//    NSURL *url = [NSURL fileURLWithPath:path isDirectory:false];
//    NSURL *readAccessToURL = [NSURL fileURLWithPath:@"file:/dist"];
    
//    [configuration.preferences setValue:@YES forKey:@"allowFileAccessFromFileURLs"];

    
//    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

//    NSURL *readAccessToURL = [[url URLByDeletingLastPathComponent]  URLByDeletingLastPathComponent];
//    NSURL *readAccessToURL = [url URLByDeletingLastPathComponent];
    
    


    
//    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [_webView loadHTMLString:html baseURL:nil];
//    [_webView loadFileURL:path allowingReadAccessToURL:<#(nonnull NSURL *)#>:html baseURL:nil];
    
//    [_webView loadFileURL:url allowingReadAccessToURL:readAccessToURL];
    
//    [_webView setNeedsDisplay];
//    [_webView setNeedsLayout];
    

    
//    let htmlURL = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "www")!


    
    
    

    [self loadURL:[NSURL URLWithString:@"http://192.168.1.123:9999/wait"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
