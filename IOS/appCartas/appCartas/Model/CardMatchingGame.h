//
//  CardMatchingGame.h
//  appCartas
//
//  Created by Jorge on 01/04/24.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

@property ( nonatomic, readonly ) NSInteger score;

// inicializador designado
- ( instancetype )initWithCardCount:( NSUInteger )count usingDeck:( Deck * )deck;
- ( void ) chooseCardAtIndex: ( NSUInteger ) index;
- ( Card * ) cardAtIndex: ( NSUInteger ) index;

@end

NS_ASSUME_NONNULL_END
