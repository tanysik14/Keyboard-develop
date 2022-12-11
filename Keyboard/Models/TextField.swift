//
//  TextField.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/15/22.
//

// singleton TextField
class TextField {
    static var shared = TextField()
    
    var currentText: String = ""
    
    private init() {}
}
