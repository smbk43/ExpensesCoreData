//
//  CoreDataClass.swift
//  ExpensesCoreData
//
//  Created by Sean Buchholz on 12/1/17.
//  Copyright © 2017 Sean Buchholz. All rights reserved.
//

import UIKit
import CoreData
@objc(ExpenseCore)
public class Expense: NSManagedObject { var date: Date? { get { return rawDate as Date? }
        set { rawDate = newValue as NSDate? } }
    convenience init?(name: String?, amount: Double, date: Date?) { let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return nil }
        self.init(entity: Expense.entity(), insertInto: managedContext)
        self.name = name; self.amount = amount; self.date = date } }
