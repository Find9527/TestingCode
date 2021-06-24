//
//  ConversionViewController.swift
//  212
//
//  Created by Orange on 2021/6/21.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    var huashiduvalue:Measurement<UnitTemperature>? {
        didSet {
            updatesheshidu()
        }
    }
    var sheshiduvalue:Measurement<UnitTemperature>? {
        if huashiduvalue != nil {
            return huashiduvalue!.converted(to: .celsius)
        }
        else{
            return nil
        }
    }
    
    @IBOutlet weak var sheshiduLabel: UILabel!
    
    @IBAction func huashiduChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            huashiduvalue = Measurement(value: value, unit: .fahrenheit)
        }
        else {
            huashiduvalue = nil
        }
    }
    
        
    func updatesheshidu() {
        if sheshiduvalue != nil {
            sheshiduLabel.text = "\(sheshiduvalue!.value)"
            sheshiduLabel.text = numberFormatter.string(from: NSNumber(value: sheshiduvalue!.value))
        }
        else {
            sheshiduLabel.text = "???"
        }
    }
    

    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("current text:\(String(describing: textField.text))")
        print("replacement text:\(string)")
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("con loaded")
        updatesheshidu()
    }
    
    
    
    
}
