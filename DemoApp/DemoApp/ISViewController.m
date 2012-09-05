#import "ISViewController.h"
#import "UINavigationController+MyTransition.h"

@implementation ISViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.hidesBackButton = YES;
        self.navigationItem.title = @"Sample";
        
        self.navigationItem.leftBarButtonItem =
        [[[UIBarButtonItem alloc] initWithTitle:@"Pop"
                                          style:UIBarButtonItemStyleBordered
                                         target:self
                                         action:@selector(pop)] autorelease];
        
        self.navigationItem.rightBarButtonItem =
        [[[UIBarButtonItem alloc] initWithTitle:@"Push"
                                          style:UIBarButtonItemStyleBordered
                                         target:self
                                         action:@selector(push)] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    ISCmdLog;
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    ISCmdLog;
    [super viewWillAppear:animated];
    
    if ([self.navigationController.viewControllers count] <= 1) {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    ISCmdLog;
    [super viewDidAppear:animated];
}   

- (void)viewWillDisappear:(BOOL)animated
{
    ISCmdLog;
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    ISCmdLog;
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    ISCmdLog;
    [super didReceiveMemoryWarning];
}

- (void)viewWillUnload
{
    ISCmdLog;
    [super viewWillUnload];
}

- (void)viewDidUnload
{
    ISCmdLog;
    [super viewDidUnload];
}

- (void)dealloc
{
    ISCmdLog;
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)push
{
    ISViewController *viewController = [[[ISViewController alloc] init] autorelease];
    [self.navigationController customPushViewController:viewController];
}

- (void)pop
{
    [self.navigationController customPopViewController];
}

@end
