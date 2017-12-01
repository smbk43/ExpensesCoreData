//
//  SingleExpenseViewController.swift
//  ExpensesCoreData
//
//  Created by Sean Buchholz on 12/1/17.
//  Copyright © 2017 Sean Buchholz. All rights reserved.
//

import UIKit
class SingleExpenseViewController: UIViewController {
    @IBOutlet weak var aTextField: UITextField!
    @IBOutlet weak var dateP: UIDatePicker!
    @IBOutlet weak var nTextField: UITextField!
    var currente: Expense?
    override func viewDidLoad() { super.viewDidLoad()
        aTextField.delegate = self; nTextField.delegate = self; nTextField.text = currente?.name
        if let amount = currente?.amount { aTextField.text = "\(amount)" } ;if let date = currente?.date { dateP.date = date } }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { nTextField.resignFirstResponder()
        aTextField.resignFirstResponder() }
    @IBAction func saveExpense(_ sender: Any) { let name = nTextField.text
        let amountText = aTextField.text ?? ""; let amount = Double(amountText) ?? 0.0; let date = dateP.date
        var expense: Expense?
        if let currente = currente { currente.name = name
            currente.amount = amount; currente.date = date; expense = currente } else { expense = Expense(name: name, amount: amount, date: date) }
        if let expense = expense { do { let managedContext = expense.managedObjectContext
                try managedContext?.save()
                self.navigationController?.popViewController(animated: true) } catch { print("Error - not saved!!") } } } }
extension SingleExpenseViewController: UITextFieldDelegate { func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true } }
