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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        currentNote = Note()
        currentNote?.title = "1111"
        currentNote?.detail = "2222"
    }
}
