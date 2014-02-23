//
//  MCHMyScene.m
//  JetpackExplorer
//
//  Created by Marc Henderson on 2/10/2014.
//  Copyright (c) 2014 Marc Henderson. All rights reserved.
//

#import "MCHMenuScene.h"
#import "MCHBalloonShootScene.h"
#import "MCHPlinkoScene.h"
#import "MCHClassicScene.h"

@implementation MCHMenuScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        /* give the scene a background color
        self.backgroundColor = [SKColor colorWithRed:83.0/255 green:135.0/255 blue:170.0/255 alpha:1.0];
         */
        self.backgroundColor = [SKColor colorWithRed:83.0/255 green:135.0/255 blue:170.0/255 alpha:1.0];
        
        /* give the scene a background image
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"scene-background"];
        [background setName:@"background"];
        [background setAnchorPoint:CGPointZero];
        [self addChild:background];
         */
        
        SKLabelNode *title = [SKLabelNode labelNodeWithFontNamed:@"Helvetica Neue UltraLight"];
        title.text = @"iBabyGender";
        title.fontSize = 38;
        title.fontColor = [UIColor whiteColor];
        title.position = CGPointMake(CGRectGetMidX(self.frame),self.frame.size.height - title.frame.size.height * 2);
        [self addChild:title];
        
        /*
         self.subtitle = [SKLabelNode labelNodeWithFontNamed:@"Helvetica Neue UltraLight"];
         self.subtitle.text = @"(r o b f o rd edition)";
         self.subtitle.fontSize = 38;
         self.subtitle.position = CGPointMake(CGRectGetMidX(self.frame),self.title.position.y - self.title.frame.size.height);
         */
        
        SKLabelNode *balloonShootButtonLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica Neue UltraLight"];
        balloonShootButtonLabel.text = @"BALLOON SHOOT";
        balloonShootButtonLabel.fontSize = 28;
        balloonShootButtonLabel.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) - 30);
        balloonShootButtonLabel.fontColor = [UIColor whiteColor];
        [self addChild:balloonShootButtonLabel];
        
        self.balloonShootButton = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(self.frame.size.width, balloonShootButtonLabel.frame.size.height+60)];
        self.balloonShootButton.position = CGPointMake(CGRectGetMidX(self.frame),balloonShootButtonLabel.position.y+balloonShootButtonLabel.frame.size.height/2);
        
        SKLabelNode *plinkoButtonLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica Neue UltraLight"];
        plinkoButtonLabel.text = @"PLINKO";
        plinkoButtonLabel.fontSize = 28;
        plinkoButtonLabel.position = CGPointMake(CGRectGetMidX(self.frame),balloonShootButtonLabel.position.y - balloonShootButtonLabel.frame.size.height*3);
        plinkoButtonLabel.fontColor = [UIColor whiteColor];
        [self addChild:plinkoButtonLabel];
        
        self.plinkoButton = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(self.frame.size.width, plinkoButtonLabel.frame.size.height+60)];
        self.plinkoButton.position = CGPointMake(CGRectGetMidX(self.frame),plinkoButtonLabel.position.y+plinkoButtonLabel.frame.size.height/2);
        
        SKLabelNode *classicButtonLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica Neue UltraLight"];
        classicButtonLabel.text = @"BABY-BELLY (classic)";
        classicButtonLabel.fontSize = 28;
        classicButtonLabel.position = CGPointMake(CGRectGetMidX(self.frame),plinkoButtonLabel.position.y - balloonShootButtonLabel.frame.size.height*3);
        classicButtonLabel.fontColor = [UIColor whiteColor];
        [self addChild:classicButtonLabel];
        
        self.classicButton = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(self.frame.size.width, classicButtonLabel.frame.size.height+60)];
        self.classicButton.position = CGPointMake(CGRectGetMidX(self.frame),classicButtonLabel.position.y+classicButtonLabel.frame.size.height/2);
        
        NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
        NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
        SKLabelNode *versionDisplay = [SKLabelNode labelNodeWithFontNamed:@"Helvetica Neue UltraLight"];
        versionDisplay.text = [NSString stringWithFormat:@"version %@",version];
        versionDisplay.fontSize = 12;
        versionDisplay.position = CGPointMake(CGRectGetMidX(self.frame),versionDisplay.frame.size.height + 5);
        versionDisplay.fontColor = [UIColor whiteColor];
        [self addChild:versionDisplay];
        
        [self addChild:self.balloonShootButton];
        [self addChild:self.plinkoButton];
        [self addChild:self.classicButton];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    if([node isEqual:self.balloonShootButton]){
        SKScene *balloonScene = [[MCHBalloonShootScene alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenHorizontalWithDuration:0.5];
        [self.view presentScene:balloonScene transition:doors];
    }else if([node isEqual:self.plinkoButton]){
        SKScene *plinkoScene = [[MCHPlinkoScene alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenHorizontalWithDuration:0.5];
        [self.view presentScene:plinkoScene transition:doors];
    }else if([node isEqual:self.classicButton]){
        SKScene *classicScene = [[MCHClassicScene alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenHorizontalWithDuration:0.5];
        [self.view presentScene:classicScene transition:doors];
    }

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
