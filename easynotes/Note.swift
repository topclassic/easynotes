//
//  Note.swift
//  easynotes
//
//  Created by Chotipat on 9/1/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object{
    
    dynamic var title: String = ""
    dynamic var detail: String = ""
    dynamic var date = NSDate()
    
}