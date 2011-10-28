//
//  NSString+Lexicon.h
//
//  Created by Philipp Kuecuekyan on 10/27/11.
//  Copyright (c) 2011 phi & co. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Adds convenience methods to NSString to take advantage of some of features of NSLinguisticTagger
 namely to tag verbs, nouns, adjectives, pronouns and so on within the class string
 */

@interface NSString (Lexicon)

/**
 Break down string into grammatical components (noun, verb, adjective, pronoun, determiners)
 @returns returns dictionary with arrays containing all components of a tag, respective tag is the key
 */
- (NSDictionary*) stringLexicon;

/**
 All verbs in the class string
 @returns returns array of verbs, nil if none
 */
- (NSArray*) verbsInString;

/**
 All nouns in the class string
 @returns returns array of nouns, nil if none
 */
- (NSArray*) nounsInString;

/**
 All pronouns in the class string
 @returns returns array of pronouns, nil if none
 */
- (NSArray*) pronounsInString;

/**
 All adjectives in the class string
 @returns returns array of adjectives, nil if none
 */
- (NSArray*) adjectivesInString;

/**
 Number of nouns in the class string
 @returns returns number of nouns, 0 if none
 */
- (NSUInteger) numberOfNounsInString;

/**
 Number of verbs in the class string
 @returns returns number of verbs, 0 if none
 */
- (NSUInteger) numberOfVerbsInString;

/**
 Number of adjectives in the class string
 @returns returns number of adjectives, 0 if none
 */
- (NSUInteger) numberOfAdjectivesInString;

/**
 Number of pronouns in the class string
 @returns returns number of pronouns, 0 if none
 */
- (NSUInteger) numberOfPronounsInString;

@end
