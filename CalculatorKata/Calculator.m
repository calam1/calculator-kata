#import <Foundation/Foundation.h>
#import "Calculator.h"

@implementation Calculator {

}

- (void)guardAgainstNegativeNumbers:(int)value {
    if (value < 0){
            [NSException raise:@"NegativeNumbersException" format:@""];
        }
}

- (int)sum:(NSString *)numbers {
    int total = 0;
    NSArray *numbersArray = [numbers componentsSeparatedByString:@","];
    for (NSString *numberString in numbersArray) {
        int value = [numberString intValue];
        [self guardAgainstNegativeNumbers:value];
        total += value;
    }
    return total;
}

- (NSString *)handleNewLineDelimiter:(NSString *)numbers {
    numbers = [numbers stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbers;
}

- (void)guardConditionAgainstDuplicateDelimiters:(NSString *)numbers {
    if ([numbers rangeOfString:@",,"].location != NSNotFound) {
        [NSException raise:@"DuplicateDelimitersException" format:@""];
    }
}

- (NSString *)handleCustomDelimiters:(NSString *)numbers {
    if ([numbers hasPrefix:@"//"]){
        NSString *customDelimiter = [numbers substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbers substringWithRange:NSMakeRange(4, [numbers length]-4)];
        numbers = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbers;
}

- (int)add:(NSString *)numbers {
    numbers = [self handleCustomDelimiters:numbers];
    numbers = [self handleNewLineDelimiter:numbers];
    [self guardConditionAgainstDuplicateDelimiters:numbers];
    if ([numbers rangeOfString:@","].location != NSNotFound) {
        return [self sum:numbers];
    }

    return [numbers length] > 0 ? [numbers intValue] : 0;
}
@end