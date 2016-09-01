//
//  NewNoteController.swift
//  easynotes
//
//  Created by Chotipat on 9/1/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import UIKit

class NewNoteController: UIViewController {
     var currentNote: Note?
    
    //สร้าง note ว่างขณะกด add เพื่อรองรับข้อมูลจากหน้า notedisplay
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "shownewnote"){
            currentNote = Note()
            let notecontroller = segue.destinationViewController as! NoteDisplayController
            notecontroller.updatenote = currentNote
        }
    }
}
