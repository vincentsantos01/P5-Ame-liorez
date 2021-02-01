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
    var calcul = Calculator()
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
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
        calcul.calculs()
    }
    @IBAction func tappedResetButton(_ sender: UIButton) {
        calcul.clean()
    }
    func bind() {
            calcul.calculText = { [ weak self ] text in
                self?.textView.text = text
            }
            calcul.displayAlert = displayAlert
        }
    func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        present(alertController, animated: true)
    }
}
