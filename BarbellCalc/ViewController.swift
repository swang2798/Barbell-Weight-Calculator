//
//  ViewController.swift
//  BarbellCalc
//
//  Created by Steven Wang on 9/1/18.
//  Copyright © 2018 Steven Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let platesArray = [45, 35, 25, 10, 5]
    var platesUsedArray = [Int]()
    
    @IBOutlet weak var weightEntered: UITextField!
    @IBOutlet weak var plateNumbers: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightEntered.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func calculatePressed(_ sender: Any) {
        calculatePlates()
    } 
    
    func calculatePlates() {
        var weight = Int(weightEntered.text!)
        weight = (weight! - 45) / 2

        for i in 0...4 {
            while(weight! >= platesArray[i]) {
                weight!-=platesArray[i]
                platesUsedArray.append(platesArray[i])
            }
        }
        for element in platesUsedArray {
            print(element)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        weightEntered.resignFirstResponder()
    }
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
