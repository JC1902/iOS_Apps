//
//  ViewController.m
//  appCartas
//
//  Created by Jorge on 24/03/24.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property ( strong, nonatomic ) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- ( CardMatchingGame * ) game {
    
    if ( !_game ) _game = [ [ CardMatchingGame alloc ] initWithCardCount:[ self.cardButtons count ] usingDeck:[ self createDeck] ];
    
    return _game;
    
}

- ( Deck * ) createDeck {
    
    return [[PlayingCardDeck alloc] init];
    
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    unsigned long int chosenButtonIndex = [ self.cardButtons indexOfObject:sender ];
    [ self.game chooseCardAtIndex:chosenButtonIndex ];
    [ self updateUI ];
    
}

- ( void ) updateUI {
    
    for ( UIButton *cardButton in self.cardButtons ) {
        
        unsigned long int cardButtonIndex = [ self.cardButtons indexOfObject:cardButton ];
        Card *card = [ self.game cardAtIndex:cardButtonIndex ];
        [ cardButton setTitle:[ self titleForCard:card ] forState:UIControlStateNormal ];
        [ cardButton setBackgroundImage:[ self backgroundImageForCard:card ] forState:UIControlStateNormal ];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [ NSString stringWithFormat:@"Score: %ld", self.game.score ];
        
    }
    
}

- ( NSString * ) titleForCard: ( Card * ) card {
    
    return card.isChosen ? card.contents : @"";
    
}

- ( UIImage * ) backgroundImageForCard: ( Card * ) card {
    
    return [ UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback" ];
    
}

@end
