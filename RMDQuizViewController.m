//
//  RMDQuizViewController.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/25/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDQuizViewController.h"
#import "RMDUser.h"
#import "RMDQuizCollectionViewCell.h"
#import "RMDConstants.h"

@interface RMDQuizViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UILabel *targetLabel;
@property (nonatomic, strong) UILabel *noCategoryLabel;
@property (nonatomic, strong) NSArray *targetWords;
@property (nonatomic, strong) NSMutableArray *potentialGuessWords;
@property (nonatomic, strong) NSMutableArray *guessWords;
@property (nonatomic, strong) NSString *rightAnswer;
@property (nonatomic, strong) RMDCategory *currentCategory;

@end

@implementation RMDQuizViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Quiz";
        self.view.backgroundColor = [RMDConstants backgroundColor];
        [self setUpLabel];
        [self setUpCollectionView];
        [self setUpNoCategoryLabel];
    }
    return self;
}

- (void)setUpLabel {
    self.targetLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    self.targetLabel.textAlignment = NSTextAlignmentCenter;
    self.targetLabel.font = [UIFont fontWithName:@"Helvetica" size:25.0];
    self.targetLabel.textColor = [RMDConstants textColor];
    [self.view addSubview:self.targetLabel];
}

- (void)setUpNoCategoryLabel {
    self.noCategoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, self.view.frame.size.width - 80, self.view.frame.size.height - 40)];
    self.noCategoryLabel.textAlignment = NSTextAlignmentCenter;
    self.noCategoryLabel.font = [UIFont fontWithName:@"Helvetica" size:25.0];
    self.noCategoryLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.noCategoryLabel.numberOfLines = 0;
    self.noCategoryLabel.textColor = [RMDConstants textColor];
    [self.view addSubview:self.noCategoryLabel];
}
                               
- (void)setUpCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(self.view.frame.size.width / 2 - 5, self.view.frame.size.height / 5)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [RMDConstants backgroundColor];
    [self.collectionView registerClass:[RMDQuizCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    [self.view addSubview:self.collectionView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [self refreshCollection];
    if ([RMDUser currentUser].currentCategory) {
        if ([self.targetWords count] > 0) {
            self.noCategoryLabel.text = @"";
        } else {
            self.noCategoryLabel.text = @"Please add cards to start learning!";
        }
    } else {
        self.noCategoryLabel.text = @"Please select a card set to start learning!";
    }
}

- (void)refreshCollection {
    self.currentCategory = [RMDUser currentUser].currentCategory;
    self.targetWords = [self.currentCategory allWords];
    self.potentialGuessWords = [NSMutableArray arrayWithArray:[self.currentCategory allDefinitions]];
    if ([self.targetWords count] > 0) {
        [self pickTargetWord];
        [self pickSixOptions];
        [self shuffleGuesses];
    } else {
        self.targetLabel.text = @"";
    }
    [self.collectionView reloadData];
}

- (void)pickSixOptions {
    NSString *potentialGuessWord = [[NSString alloc] init];
    if ([self.targetWords count] >= 6) {
        while ([self.guessWords count] < 6) {
            potentialGuessWord = [self.potentialGuessWords objectAtIndex:arc4random_uniform([self.potentialGuessWords count])];
            [self.guessWords addObject:potentialGuessWord];
            [self.potentialGuessWords removeObject:potentialGuessWord];
        }
    } else {
        while([self.guessWords count] < [self.targetWords count]) {
            potentialGuessWord = [self.potentialGuessWords objectAtIndex:arc4random_uniform([self.potentialGuessWords count])];
            [self.guessWords addObject:potentialGuessWord];
            [self.potentialGuessWords removeObject:potentialGuessWord];
        }
    }
}

- (void)shuffleGuesses {
    NSMutableArray *temporaryArray = [NSMutableArray arrayWithArray:self.guessWords];
    NSString *temporaryString = [[NSString alloc] init];
    for (int i = 0; i < [self.guessWords count]; i++) {
        temporaryString = [temporaryArray objectAtIndex:arc4random_uniform([temporaryArray count])];
        [self.guessWords replaceObjectAtIndex:i withObject:temporaryString];
        [temporaryArray removeObject:temporaryString];
    }
}

- (void)pickTargetWord {
    RMDCard *card = [self.currentCategory.cards objectAtIndex:arc4random_uniform([self.targetWords count])];
    self.targetLabel.text = card.word;
    self.rightAnswer = card.definition;
    [self.potentialGuessWords removeObject:self.rightAnswer];
    self.guessWords = [[NSMutableArray alloc] initWithObjects:self.rightAnswer, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.targetWords count] >= 6) {
        return 6;
    } else {
        return [self.targetWords count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RMDQuizCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.label.text = [self.guessWords objectAtIndex:indexPath.row];
    cell.contentView.backgroundColor = [RMDConstants contrastColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    RMDQuizCollectionViewCell *guessedCell = (RMDQuizCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSIndexPath *correctIndex = [NSIndexPath indexPathForItem:[self.guessWords indexOfObject:self.rightAnswer] inSection:0];
    if ([[self.guessWords objectAtIndex:indexPath.row] isEqualToString:self.rightAnswer]) {
        guessedCell.contentView.backgroundColor = [RMDConstants correctAnswerColor];
    } else {
        guessedCell.contentView.backgroundColor = [RMDConstants wrongAnswerColor];
        RMDQuizCollectionViewCell *correctCell = (RMDQuizCollectionViewCell *)[collectionView cellForItemAtIndexPath:correctIndex];
        correctCell.contentView.backgroundColor = [RMDConstants correctAnswerColor];
    }
    [self performSelector:@selector(refreshCollection) withObject:self.collectionView afterDelay:1.0];
}

@end
