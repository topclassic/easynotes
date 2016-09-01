//
//  NoteTableViewCell.swift
//  easynotes
//
//  Created by Chotipat on 9/1/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//
import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet var titlelabel: UILabel!
    @IBOutlet var datelabel: UILabel!
    
    // สำหรับกำหนดรูปแบบการแสดงผลวันที่
    static var dateformat: NSDateFormatter = {
        var format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format
        
    }()
    
    //didSet จะทำหน้าที่หลังตัวแปร Note เกิดการเปลี่ยนแปลง (ข้อมูลที่ถูกเก็บใน realm มีการ update) การแสดงผลที่ table view cell จะได้รับการ update
    var updatenote: Note? {
        didSet {
            if let updatenote = updatenote, titlelabel = titlelabel, datelabel = datelabel{
                titlelabel.text = updatenote.title
                datelabel.text = NoteTableViewCell.dateformat.stringFromDate(updatenote.date)
            }
        }
    }

}
