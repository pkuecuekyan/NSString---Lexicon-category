//
//  NSString+Lexicon.m
//
//  Created by Philipp Kuecuekyan on 10/27/11.
//  Copyright (c) 2011 phi & co. All rights reserved.
//

#import "NSString+Lexicon.h"

@implementation NSString (Lexicon)

- (NSDictionary*) stringLexicon {
    NSRange stringRange = NSMakeRange(0, (NSUInteger)[self length]);
	
    NSArray *language = [NSArray arrayWithObjects:@"en", nil];
    NSDictionary* languageMap = [NSDictionary dictionaryWithObject:language forKey:@"Latn"];
    
    NSMutableDictionary *stringLexicon = [NSMutableDictionary dictionary];
    NSMutableArray *nounArray = [NSMutableArray array];
    NSMutableArray *verbArray = [NSMutableArray array];
    NSMutableArray *pronounArray = [NSMutableArray array];
    NSMutableArray *prepositionArray = [NSMutableArray array];
	NSMutableArray *adjectiveArray = [NSMutableArray array];
    NSMutableArray *determinerArray = [NSMutableArray array];
    
    [self enumerateLinguisticTagsInRange:stringRange 
                                  scheme:NSLinguisticTagSchemeLexicalClass 
                                 options:0
                             orthography:[NSOrthography orthographyWithDominantScript:@"Latn" languageMap:languageMap]
                              usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
                                  if ([tag isEqualToString:@"Noun"]) 
                                      [nounArray addObject:[self substringWithRange:tokenRange]];
                                  else if ([tag isEqualToString:@"Verb"]) 
                                      [verbArray addObject:[self substringWithRange:tokenRange]];
                                  else if ([tag isEqualToString:@"Pronoun"]) 
                                      [pronounArray addObject:[self substringWithRange:tokenRange]];
                                  else if ([tag isEqualToString:@"Preposition"])
                                      [prepositionArray addObject:[self substringWithRange:tokenRange]];
                                  else if ([tag isEqualToString:@"Determiner"])
                                      [determinerArray addObject:[self substringWithRange:tokenRange]];
                                  else if ([tag isEqualToString:@"Adjective"])
                                      [adjectiveArray addObject:[self substringWithRange:tokenRange]];
                                  
                              }];
    if ([nounArray count] > 0) {
        [stringLexicon setValue:nounArray forKey:@"nouns"];
    }
    if ([verbArray count] > 0) {
        [stringLexicon setValue:verbArray forKey:@"verbs"];
    }
    if ([adjectiveArray count] > 0) {
        [stringLexicon setValue:adjectiveArray forKey:@"adjectives"];
    }
    if ([pronounArray count] > 0) {
        [stringLexicon setValue:pronounArray forKey:@"pronouns"];
    }
    if ([prepositionArray count] > 0) {
        [stringLexicon setValue:prepositionArray forKey:@"prepositions"];
    }
    if ([determinerArray count] > 0) {
        [stringLexicon setValue:determinerArray forKey:@"determiners"];
    }
    return (NSDictionary*)stringLexicon;
    
}

- (NSArray*) nounsInString {
    NSArray *nouns = [[self stringLexicon] objectForKey:@"nouns"];
    if (nouns != nil)
        return nouns;
    return nil;
}

- (NSArray*) verbsInString {
    NSArray *verbs = [[self stringLexicon] objectForKey:@"verbs"];
    if (verbs != nil)
        return verbs;
    return nil;
}

- (NSArray*) adjectivesInString {
    NSArray *adjectives = [[self stringLexicon] objectForKey:@"adjectives"];
    if (adjectives != nil)
        return adjectives;
    return nil;
}

- (NSArray*) pronounsInString {
    NSArray *adjectives = [[self stringLexicon] objectForKey:@"adjectives"];
    if (adjectives != nil)
        return adjectives;
    return nil;
}

- (NSUInteger) numberOfNounsInString {
    return [[[self stringLexicon] objectForKey:@"nouns"] count];    
}

- (NSUInteger) numberOfVerbsInString {
    return [[[self stringLexicon] objectForKey:@"verbs"] count];
}

- (NSUInteger) numberOfAdjectivesInString {
    return [[[self stringLexicon] objectForKey:@"adjectives"] count];
}

- (NSUInteger) numberOfPronounsInString {
    return [[[self stringLexicon] objectForKey:@"pronouns"] count];
}

@end
