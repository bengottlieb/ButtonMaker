//
//  ButtonMakerViewController.m
//  ButtonMaker
//
//  Created by Dermot Daly on 22/04/2010.
//  Copyright tapadoo 2010. All rights reserved.
//

#import "ButtonMakerViewController.h"

@implementation ButtonMakerViewController

@synthesize redSlider;
@synthesize greenSlider;
@synthesize blueSlider;
@synthesize widthSlider;
@synthesize heightSlider;

@synthesize redValueLabel;
@synthesize greenValueLabel;
@synthesize blueValueLabel;
@synthesize heightLabel;
@synthesize widthLabel;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	// Force the first draw
	[self colorSliderChanged:nil];
	[self sizeSlideChanged:nil];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[theButton release];
    [super dealloc];
}

-(void) updateButton { 
	if(theButton != nil) {
		[theButton removeFromSuperview];
		[theButton release];
		theButton = nil;
	}
	// OK - Create it
	CGFloat width = roundf(widthSlider.value);
	CGFloat height = roundf(heightSlider.value);
	CGFloat x = 160.0 - width/2;
	CGFloat y = 280.0;
	CGFloat red = roundf(redSlider.value)/255.0;
	CGFloat green = roundf(greenSlider.value)/255.0;
	CGFloat blue = roundf(blueSlider.value)/255.0;
	
	Class theClass = NSClassFromString(@"UIGlassButton");
	theButton = [[theClass alloc] initWithFrame:CGRectMake(x, y, width, height)];
	[theButton setValue:[UIColor colorWithRed:red green:green blue:blue alpha:1.0] forKey:@"tintColor"];
	[self.view addSubview:theButton];
}

-(IBAction) colorSliderChanged:(id)sender {
	// Update all the color labels
	redValueLabel.text = [NSString stringWithFormat:@"%.0f", roundf(redSlider.value)];
	blueValueLabel.text = [NSString stringWithFormat:@"%.0f", roundf(blueSlider.value)];
	greenValueLabel.text = [NSString stringWithFormat:@"%.0f", roundf(greenSlider.value)];
	[self updateButton];
}
-(IBAction) sizeSlideChanged:(id)sender {
	widthLabel.text = [NSString stringWithFormat:@"%.0f", roundf(widthSlider.value)];
	heightLabel.text = [NSString stringWithFormat:@"%.0f", roundf(heightSlider.value)];
	[self updateButton];
}
-(IBAction) saveTapped:(id)sender {
	UIGraphicsBeginImageContext(theButton.frame.size);
	CGContextRef theContext = UIGraphicsGetCurrentContext();
	[theButton.layer renderInContext:theContext];
	
	UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
	NSData *theData = UIImagePNGRepresentation(theImage);
	[theData writeToFile:@"/tmp/button.png" atomically:NO];
	UIGraphicsEndImageContext();
	[theButton setHighlighted:YES];
	UIGraphicsBeginImageContext(theButton.frame.size);
	theContext = UIGraphicsGetCurrentContext();
	[theButton.layer renderInContext:theContext];
	
	theImage = UIGraphicsGetImageFromCurrentImageContext();
	theData = UIImagePNGRepresentation(theImage);
	[theData writeToFile:@"/tmp/button-highlighted.png" atomically:NO];
	UIGraphicsEndImageContext();
	[theButton setHighlighted:NO];
	
}

@end
