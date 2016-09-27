//
//  SRDConversieCell.m
//  Koers
//
//  Created by Jeroen Dunselman on 25/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import "SRDConversieCell.h"

@implementation SRDConversieCell
@synthesize valutaType;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldSelected) name:UITextFieldTextDidBeginEditingNotification object:nil];
}

- (void)textFieldSelected {
//    [self.txtValutaType setSelectedRange:NSMakeRange(5,0)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)changeVal:(id)sender {
//    [self.delegate changedToValue: forValutaType:self.valutaType];
//    NSLog(@"changeVal: %@", self.valueEdited.text);
//    UITextPosition *beginning = [self.valueEdited beginningOfDocument];
//    [self.valueEdited setSelectedTextRange:[self.valueEdited
//                    textRangeFromPosition:beginning
//                                            toPosition:beginning];
//
//    UITextPosition *start = self.valueEdited.beginningOfDocument;
//    NSInteger startOffset = [self.valueEdited offsetFromPosition:self.valueEdited.beginningOfDocument toPosition:start];
//    NSInteger endOffset = [self.valueEdited offsetFromPosition:self.valueEdited.beginningOfDocument toPosition:end];
//    NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
////    NSRange *rng = self rangeFromTextRange:<#(UITextRange *)#> inTextView:<#(UITextView *)#>
    
//    UITextRange *selRange = self.valueEdited.selectedTextRange;
//    UITextPosition *selStartPos = selRange.start;
//    NSInteger idx = [self.valueEdited offsetFromPosition:self.valueEdited.beginningOfDocument toPosition:selStartPos];
    
//    [myclass selectTextForInput:self.valueEdited atRange:NSMakeRange(idx, 0)];
    
   if (_cellDelegate && [_cellDelegate respondsToSelector:@selector(changedToValue: forValutaType:)]) {
//        [_cellDelegate getPhoto];
            [_cellDelegate changedToValue:self.valueEdited.amount forValutaType:self.valutaType];
//       NSNumberFormatter *myFrm = [self.valueEdited currencyNumberFormatter];
//       [self.valueEdited.currencyNumberFormatter setCurrencySymbol:@"htsflts" ];
//       NSLog(@"myFrm.currencySymbol: %@", myFrm.internationalCurrencySymbol);
    }
   
    
}
- (NSRange)rangeFromTextRange:(UITextRange *)textRange inTextView:(UITextView*)textView {
    
    UITextPosition* beginning = textView.beginningOfDocument;
    UITextPosition* start = textRange.start;
    UITextPosition* end = textRange.end;
    
    const NSInteger location = [textView offsetFromPosition:beginning toPosition:start];
    const NSInteger length = [textView offsetFromPosition:start toPosition:end];
    
    return NSMakeRange(location, length);
}
@end
