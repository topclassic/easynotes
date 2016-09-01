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
    
    var selectNote: Note?
    
    @IBAction func unwindToSegue(segue: UIStoryboardSegue){
        if let id = segue.identifier{
            do{
                let realm = try Realm()
                switch id {
                case "save":
                    //จับว่า Controller ต้นทางเป็นใคร เพื่อให้เราสามารถเข้าถึงตัวแปร currentNote ในหน้า NewNote จากหน้า NoteTableController นี้ได
                    let source = segue.sourceViewController as! NewNoteController
                    try realm.write(){
                        realm.add(source.currentNote!)
                    }
                case "delete":
                    try realm.write(){
                        realm.delete(self.selectNote!)
                    }
              
                default: print("Identifier \(id)")
                }
                notes = realm.objects(Note).sorted("date", ascending: false) //เรียงข้อมูลที่แสดงจากวันที่ล่สุด
            }catch{
                print("handle error")
            }
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
    
    //ทำงานเมื่อมีการเลือก cell ใน TableView
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath){
        selectNote = notes[indexPath.row]
        self.performSegueWithIdentifier("show", sender: self)
    }
    //กำหนดว่า TableView สามารถแก้ไขได้หรอไม่
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return true
    }
    //ลบข้อมูลใน realm และ cell นั้นๆออกไป เมื่อ user ปาดนิ้วแล้วเลือก DELETE (แถบ delete เป็น default สำหรับการเขียนแบบนี้)
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath:NSIndexPath){
        
        if editingStyle == .Delete{
            let note = notes[indexPath.row] as Object
            do{
                let realm = try Realm()
                try realm.write(){
                    realm.delete(note)
                }
                notes = realm.objects(Note).sorted("date", ascending: false)
            }catch{
                print("handle error")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        do{
            let realm = try Realm()
            notes = realm.objects(Note).sorted("date", ascending: false)
        }catch{
            print("handle error")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

