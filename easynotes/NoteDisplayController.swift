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
    @IBOutlet var titletextfield: UITextField!
    @IBOutlet var titletextview: UITextView!
    
    var updatenote: Note?{
        didSet{
            displaynote(updatenote)
        }
    }
    func  displaynote(note: Note?){
        if let updatenote = updatenote, titletextfield = titletextfield, titletextview = titletextview{
            titletextfield.text = updatenote.title
            titletextview.text = updatenote.detail
        }
    }
}
