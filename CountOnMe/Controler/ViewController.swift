//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    var calcul = Calculs()
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
            guard let numberText = sender.title(for: .normal) else {
                return
            }
            calcul.addNewNumber(number: numberText)
        }
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        calcul.addOperator(operateur: "+")
    }
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        calcul.addOperator(operateur: "-")
    }
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        calcul.addOperator(operateur: "x")
    }
    @IBAction func tappedDiviseButton(_ sender: UIButton) {
        calcul.addOperator(operateur: "%")
    }
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calcul.calculator()
    }
    @IBAction func tappedResetButton(_ sender: UIButton) {
        calcul.clean()
    }
}