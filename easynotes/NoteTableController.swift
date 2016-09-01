//
//  ViewController.swift
//  easynotes
//
//  Created by Chotipat on 8/29/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleAnalytics
class NoteTableViewController: UITableViewController {
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath) as! NoteTableViewCell
        cell.titlelabel.text = "1234"
        cell.datelabel.text = "01/02/34"
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

