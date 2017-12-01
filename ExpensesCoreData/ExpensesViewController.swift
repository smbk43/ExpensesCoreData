//
//  ExpensesViewController.swift
//  ExpensesCoreData
//
//  Created by Sean Buchholz on 12/1/17.
//  Copyright © 2017 Sean Buchholz. All rights reserved.
//

import UIKit
import CoreData
class ExpensesViewController: UIViewController {
    @IBOutlet weak var expensesTableView: UITableView!
    let dateF = DateFormatter()
    var e = [Expense]()
    override func viewDidLoad() { super.viewDidLoad()
        dateF.dateStyle = .long; dateF.timeStyle = .long }
    override func viewWillAppear(_ animated: Bool) { guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContex = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        do { e = try managedContex.fetch(fetchRequest)
            expensesTableView.reloadData() } catch { print("Error - fetch failed!!") } }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    @IBAction func addNewExpense(_ sender: Any) { performSegue(withIdentifier: "showExpense", sender: self) }}
extension ExpensesViewController: UITableViewDataSource { func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return e.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { let cell = expensesTableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        let expense = e[indexPath.row]
        cell.textLabel?.text = expense.name
        if let date = expense.date { cell.detailTextLabel?.text = dateF.string(from: date) }
        return cell }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { guard let destination = segue.destination as? SingleExpenseViewController,
            let selectedRow = self.expensesTableView.indexPathForSelectedRow?.row else { return }
        destination.currente = e[selectedRow] }
    func deleteExpense(at indexPath: IndexPath) { let expense = e[indexPath.row]
        if let managedContext = expense.managedObjectContext { managedContext.delete(expense)
            do { try managedContext.save()
                self.e.remove(at: indexPath.row)
                expensesTableView.deleteRows(at: [indexPath], with: .automatic) } catch { print("Error - delete cancelled!!")
                expensesTableView.reloadRows(at: [indexPath], with: .automatic) } } }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) { if editingStyle == .delete { deleteExpense(at: indexPath) } } }
extension ExpensesViewController: UITableViewDelegate { func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { performSegue(withIdentifier: "showExpense", sender: self) } }
