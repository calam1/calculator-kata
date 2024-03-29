#import "CalculatorTest.h"
#import "Calculator.h"

@implementation CalculatorTest
- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero {
    int result = [sut add:@""];
    int expected = 0;

    STAssertEquals(expected, result, @"Zero length input should return zero.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"3"];
    int expected = 3;

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"3, 4"];
    int expected = 7;

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howManyTimes = arc4random() % 999;
    int expected = 0;
    NSMutableString *numbers = [NSMutableString string];

    for (int i = 0; i < howManyTimes; i++) {
        [numbers appendString:[NSString stringWithFormat:@"%d,", i]];
        expected += i;
    }

    int result = [sut add:numbers];

    STAssertEquals(expected, result, @"Any length input should return sum.");
}

- (void)testAddMethod_NewLineDelimiterInput_ReturnsSum {
    int result = [sut add:@"3, 4\n5"];
    int expected = 12;

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

-(void) testAddMethod_DuplicateDelimiter_ThrowsExpectedException{
    STAssertThrowsSpecificNamed([sut add:@"2,,4"], NSException , @"DuplicateDelimitersException", @"");
}

- (void)testAddMethod_NewCustomDelimiterInput_ReturnsSum {
    int result = [sut add:@"//$\n2$3,4\n5"];
    int expected = 14;

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

-(void) testAddMethod_NegativeNumber_ThrowsExpectedException{
    STAssertThrowsSpecificNamed([sut add:@"2,-5,4"], NSException , @"NegativeNumbersException", @"");
}


@end
