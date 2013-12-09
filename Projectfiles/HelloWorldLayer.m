/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim. 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"
CCSprite *ship1;
CCSprite *ship2;

@interface HelloWorldLayer (PrivateMethods)
@end

@implementation HelloWorldLayer

@synthesize helloWorldString, helloWorldFontName;
@synthesize helloWorldFontSize;

-(id) init
{
    
    if ((self = [super init]))
    {
        
        //Initialize the ship sprite with a specific file, the ship image
        ship1 = [CCSprite spriteWithFile: @"ship.png"];
        
        //Set the ship's position
        ship1.position = ccp( 50, 200 );
        
        //Initialize the other sprite
        ship2 = [CCSprite spriteWithFile: @"ship.png"];
        
        //Set the other ship's position
        ship2.position = ccp( 100, 50 );
        
        //Add the ships to the game
        [self addChild:ship1];
        [self addChild:ship2];
        
        [self scheduleUpdate];
        
    }
    return self;
}


- (void) update:(ccTime)dt
{
    
    //move the ship only in the x direction by a fixed amount every frame
    ship1.position = ccp( ship1.position.x + 100*dt, ship1.position.y );
    
    if (ship1.position.x > 480+32)
    {
        //if the ship reaches the edge of the screen, loop around
        ship1.position = ccp( -32, ship1.position.y );
        
    }
    
    
    
    KKInput* input = [KKInput sharedInput];
    CGPoint pos = [input locationOfAnyTouchInPhase:KKTouchPhaseBegan];
    
    if (pos.x != 0 && pos.y != 0)
    {
        [ship2 runAction: [CCMoveTo actionWithDuration:1 position:pos]];
        //[[CCDirector sharedDirector] pushScene: [GameOver node]];
    }
}