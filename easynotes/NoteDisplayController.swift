//
//  NoteDisplayController.swift
//  easynotes
//
//  Created by Chotipat on 9/1/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import UIKit
import RealmSwift
class NoteDisplayController: UIViewController {
  //  @IBOutlet var titletextfield: UITextField!
    @IBOutlet var titletextview: UITextView!
    
    var updatenote: Note?{
        didSet{
            displaynote(updatenote)
        }
    }
    func  displaynote(note: Note?){
        if let updatenote = updatenote, titletextview = titletextview{
          //  titletextfield.text = updatenote.detail
            titletextview.text = updatenote.detail
        }
    }
    //นำข้อมูลจาก prepareForSegue NoteTable มาแสดง
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displaynote(updatenote)
    }
    //ทำงานเมื่อหน้า display กำลังหายไป
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        saveNote()
    }
    func saveNote(){
        if let note = updatenote {
            do{
                let realm = try Realm()
                try realm.write{
                    if(note.title != self.titletextview.text || note.detail != self.titletextview.text)
                    {
                        note.title = self.titletextview.text!
                        note.detail = self.titletextview.text
                        note.date = NSDate()
                    }
                }
            }catch{
                print("handle error")
            }
        }
    }
}
