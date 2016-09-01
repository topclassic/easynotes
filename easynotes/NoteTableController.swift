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
    
    @IBAction func unwindForSegue(segue: UIStoryboardSegue) {
        if let id = segue.identifier{
            print("ID\(id)")
        }
    }
    //สำหรับเก็บขอมูลแต่ละ note
    var notes: Results<Note>!{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath) as! NoteTableViewCell
        let row = indexPath.row
        let note = notes[row] as Note
        cell.updatenote = note
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return notes.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let mynote = Note()
        mynote.title = "1234"
        mynote.detail = "hhhhhhhh"
        
        //ทำการบันทึก note ลงใน realm
        do{
            let realm = try Realm()
            try realm.write(){
                realm.add(mynote)
            }
            notes = realm.objects(Note) //update ตัวแปร notes ให้ข้อมูลตรงกับใน realm
        }catch{
            print("Handle Error")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

