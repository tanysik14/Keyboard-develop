//
//  Keys.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/17/22.
//

// singleton Keys
class Keys {
    static let shared = Keys()
    
    let enKeys: [Character] = [
        "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
        "a", "s", "d", "f", "g", "h", "j", "k", "l",
        "z", "x", "c", "v", "b", "n", "m"
    ]
    
    let numbersKeys: [Character] = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
        "-", "/", ":", ";", "(", ")", "$", "&", "@", "\"",
        ".", ",", "?", "!", "'"
    ]
    
    let symbolsKeys: [Character] = [
        "[", "]", "{", "}", "#", "%", "^", "*", "+", "=",
        "_", "\\", "|", "~", "<", ">", "$", "€", "£", "•",
        ".", ",", "?", "!", "'"
    ]
    
    let ruKeys: [Character] = [
        "й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х", "ъ",
        "ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э",
        "я", "ч", "с", "м", "и", "т", "ь", "б", "ю"
    ]
    
    private init() {}
}
