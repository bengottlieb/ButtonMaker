//
//  ButtonMakerViewController.h
//  ButtonMaker
//
//  Created by Dermot Daly on 22/04/2010.
//  Copyright tapadoo 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonMakerViewController : UIViewController {
	UISlider *redSlider;
	UISlider *greenSlider;
	UISlider *blueSlider;
	UISlider *widthSlider;
	UISlider *heightSlider;
	
	UILabel *redValueLabel;
	UILabel *greenValueLabel;
	UILabel *blueValueLabel;
	UILabel *heightLabel;
	UILabel *widthLabel;
	
	UIButton *theButton;
}

@property(nonatomic, retain) IBOutlet UISlider *redSlider;
@property(nonatomic, retain) IBOutlet UISlider *greenSlider;
@property(nonatomic, retain) IBOutlet UISlider *blueSlider;
@property(nonatomic, retain) IBOutlet UISlider *widthSlider;
@property(nonatomic, retain) IBOutlet UISlider *heightSlider;

@property(nonatomic, retain) IBOutlet UILabel *redValueLabel;
@property(nonatomic, retain) IBOutlet UILabel *greenValueLabel;
@property(nonatomic, retain) IBOutlet UILabel *blueValueLabel;
@property(nonatomic, retain) IBOutlet UILabel *heightLabel;
@property(nonatomic, retain) IBOutlet UILabel *widthLabel;

-(IBAction) colorSliderChanged:(id)sender;
-(IBAction) sizeSlideChanged:(id)sender;
-(IBAction) saveTapped:(id)sender;
@end

