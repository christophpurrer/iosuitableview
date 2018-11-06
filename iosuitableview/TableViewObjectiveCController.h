//
//  TableViewObjectiveCController.h
//  iosuitableview
//
//  Created by Christoph Purrer on 11/5/18.
//  Copyright © 2018 Christoph Purrer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewObjectiveCController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    
    IBOutlet UITableView *tableView;
    NSMutableArray *tableData;
}
@end
