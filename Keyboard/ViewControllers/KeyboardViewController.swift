//
//  EnViewController.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/17/22.
//

import UIKit

class KeyboardViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet var textField: UITextView!
    @IBOutlet var enStackView: UIStackView!
    @IBOutlet var numbersStackView: UIStackView!
    @IBOutlet var symbolsStackView: UIStackView!
    @IBOutlet var oneAndTwoStringStackView: UIStackView!
    @IBOutlet var ruStackView: UIStackView!
    
    @IBOutlet var shiftButton: UIButton!
    @IBOutlet var symbolsButton: UIButton!
    
    @IBOutlet var enKeysCollection: [UIButton]!
    @IBOutlet var ruKeysCollection: [UIButton]!
    @IBOutlet var numbersKeysCollection: [UIButton]!
    @IBOutlet var iconsCollection: [UIButton]!
    
    // MARK: variables and constants
    let enKeys = Keys.shared.enKeys
    let numbers = Keys.shared.numbersKeys
    let symbols = Keys.shared.symbolsKeys
    let ruKeys = Keys.shared.ruKeys
    var currentText: String = TextField.shared.currentText
    
    // MARK: override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // to add focus to textField
        textField.becomeFirstResponder()
    }
    
    // MARK: IBAction
    @IBAction func keyButtonTaped(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {return}
        textField.text += buttonTitle
        
        enKeysCollection.forEach {
            guard let keyIndex = enKeysCollection.firstIndex(of: $0) else { return }
            $0.setTitle(String(enKeys[keyIndex]), for: .normal)
        }
        
        ruKeysCollection.forEach {
            guard let keyIndex = ruKeysCollection.firstIndex(of:  $0) else { return }
            $0.setTitle(String(ruKeys[keyIndex]), for: .normal)
        }
        
        guard let shiftImage = UIImage(systemName: "shift") else { return }
        shiftButton.setImage(
            shiftImage,
            for: .normal)
    }
    
    @IBAction func spaceButtonTapped() {
        textField.text += " "
        currentText = textField.text
    }
    
    @IBAction func deleteButtonTapped() {
        textField.text.remove(at: textField.text.index(before: textField.text.endIndex))
        currentText = textField.text
    }
    
    @IBAction func shiftButtonTapped() {
        currentText = textField.text
        guard let currentShiftImage = shiftButton.currentImage else { return }
        guard let shiftFillImage = UIImage(systemName: "shift.fill") else { return }
        
        switch currentShiftImage.isEqual(shiftFillImage) {
            
        case true:
            guard let shiftImage = UIImage(systemName: "shift") else { return }
            shiftButton.setImage(shiftImage, for: .normal)
            enKeysCollection.forEach {
                guard let keyIndex = enKeysCollection.firstIndex(of: $0) else { return }
                $0.setTitle(
                    String(enKeys[keyIndex]),
                    for: .normal)
            }
            ruKeysCollection.forEach {
                guard let keyIndex = ruKeysCollection.firstIndex(of: $0) else { return }
                $0.setTitle(
                    String(ruKeys[keyIndex]),
                    for: .normal)
            }
            
        case false:
            guard let shiftImage = UIImage(systemName: "shift.fill") else { return }
            shiftButton.setImage(shiftImage, for: .normal)
            enKeysCollection.forEach {
                guard let keyIndex = enKeysCollection.firstIndex(of: $0) else { return }
                $0.setTitle(
                    String(enKeys[keyIndex]).uppercased(),
                    for: .normal)
            }
            ruKeysCollection.forEach {
            guard let keyIndex = ruKeysCollection.firstIndex(of: $0) else { return }
            $0.setTitle(
                String(ruKeys[keyIndex]).uppercased(),
                for: .normal)
        }
        
        }
    }
    
    @IBAction func returnButtonTapped() {
        textField.text += "\n"
        currentText = textField.text
    }
    
    @IBAction func numbersButtonTapped() {
        // hide stacks
//        for stackView in [enStackView] {
//            stackView?.isHidden = true
//        }
        
        numbersStackView.isHidden = false
        enStackView.isHidden = true
        ruStackView.isHidden = true
        
//        setupKeysCollectionCorners(collection: numbersKeysCollection)
//        setupKeysCollectionTitles(collection: numbersKeysCollection, for: numbers)
//        setupIconsCollection()
    }
    
    @IBAction func symbolsButtonTapped() {
        oneAndTwoStringStackView.isHidden = true
        symbolsStackView.isHidden = false
//        guard let currentSymbolsButtonTitle = symbolsButton.currentTitle else { return }
//
//        switch currentSymbolsButtonTitle {
//
//        case "#+=":
//            symbolsButton.setTitle("123", for: .normal)
//            setupKeysCollectionTitles(collection: numbersKeysCollection,
//                                      for: symbols)
//
//        default:
//            symbolsButton.setTitle("#+=", for: .normal)
//            setupKeysCollectionTitles(collection: numbersKeysCollection,
//                                      for: numbers)
//        }
//
//        symbolsButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    
    @IBAction func abcButtonTapped() {
        // hide stacks
//        for stackView in [numbersStackView] {
//            stackView?.isHidden = true
//        }
    
        enStackView.isHidden = false
        numbersStackView.isHidden = true
        ruStackView.isHidden = true
//
//        setupKeysCollectionCorners(collection: enKeysCollection)
//        setupKeysCollectionTitles(collection: enKeysCollection, for: enKeys)
//        setupIconsCollection()
    }
    
    @IBAction func globeButtonTapped() {
        
        if ruStackView.isHidden == false {
            numbersStackView.isHidden = true
            ruStackView.isHidden = true
            enStackView.isHidden = false
            } else {
                enStackView.isHidden = true
                ruStackView.isHidden = false
                numbersStackView.isHidden = true
            }
        }

    
    // MARK: private methods
    private func setupKeysCollectionCorners(collection: [UIButton]) {
        collection.forEach {
            $0.layer.cornerRadius = 5
        }
    }
    
    private func setupKeysCollectionTitles(collection: [UIButton], for keys: [Character]) {
        collection.forEach {
            guard let keyIndex = collection.firstIndex(of: $0) else { return }
            
            switch collection {
            case enKeysCollection:
                $0.setTitle(String(enKeys[keyIndex]).uppercased(), for: .normal)
            case ruKeysCollection:  $0.setTitle(String(ruKeys[keyIndex]).uppercased(), for: .normal)
            case numbersKeysCollection:
                if keys == numbers {
                    $0.setTitle(String(numbers[keyIndex]), for: .normal)
                } else {
                    $0.setTitle(String(symbols[keyIndex]), for: .normal)
                }
            default:
                print("place for smailKeyboard")
            }
        }
    }
    
    private func setupIconsCollection() {
        iconsCollection.forEach {
            $0.layer.cornerRadius = 5
            $0.tintColor = .black
        }
    }
}

// MARK: - Private Methods
extension KeyboardViewController {
    
    private func updateUI() {
        // to disable iOS keyboard
        textField.inputView = UIView()

        textField.layer.cornerRadius = 10
        
            ruStackView.isHidden = false
            enStackView.isHidden = true
            numbersStackView.isHidden = true
        }
        

        
       
        
        
        // hide stacks
//        for stackView in [numbersStackView] {
//            stackView?.isHidden = true
//        }
//
//        setupKeysCollectionCorners(collection: enKeysCollection)
//        setupKeysCollectionTitles(collection: enKeysCollection, for: enKeys)
//
//        setupKeysCollectionCorners(collection: ruKeysCollection)
//        setupKeysCollectionTitles(collection: ruKeysCollection, for: enKeys)
//
//        setupIconsCollection()
//
//    }
}
