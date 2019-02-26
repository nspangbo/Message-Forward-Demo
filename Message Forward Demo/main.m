//
//  main.m
//  Message Forward Demo
//
//  Created by 0xwangbo on 2/26/19.
//  Copyright © 2019 Bo Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectA.h"
#import "ObjectB.h"

int main(int argc, const char * argv[]) {
    
    ObjectA *a = [[ObjectA alloc] init];
    ObjectB *b = [[ObjectB alloc] init];
    
    [a printHelloA];
    [b printHelloB];
    
    [b performSelector:@selector(printHelloA)];
    [b performSelector:@selector(printHelloA)];
    
    
    return 0;
}
