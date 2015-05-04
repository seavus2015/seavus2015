//
//  ViewController.m
//  TestCas4
//
//  Created by Design Academy 5 on 5/4/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Moni.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;

@end

@implementation ViewController


- (IBAction)btnPressed:(id)sender {
    NSLog(@"AAAAA");
    
//http://194/149.138.20/geodata.json
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://194.149.138.20/geodata.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
          NSLog(@"ok %@",responseObject);
        
        
        NSArray *geonames = [responseObject objectForKey:@"geonames"];
        for(NSDictionary *dic in geonames){
            Moni *tmp = [[Moni alloc] initWithDictionary:dic];
            NSLog(@"%@",tmp.countrycode);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"fail");
    }];
    
    
    
    
    ///////
    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    
//    NSURL *URL = [NSURL URLWithString:@"http://wallpapers55.com/wp-content/uploads/2013/08/Pamela-Anderson-2-1120x600.jpg"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    
//    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
//        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
//    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
//        NSLog(@"File downloaded to: %@", filePath);
//    }];
//    [downloadTask resume];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
