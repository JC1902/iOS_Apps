//
//  PlayingCard.h
//  appCartas
//
//  Created by Jorge on 24/03/24.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ ( NSArray * )validSuits;
+ ( NSUInteger )maxRank;
+ ( NSArray * )rankStrings;

@end

NS_ASSUME_NONNULL_END
