//
//  CoreDataProperties.swift
//  ExpensesCoreData
//
//  Created by Sean Buchholz on 12/1/17.
//  Copyright © 2017 Sean Buchholz. All rights reserved.
//

import Foundation
import CoreData
extension Expense { @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> { return NSFetchRequest<Expense>(entityName: "Expense") }
    @NSManaged public var rawDate: NSDate?; @NSManaged public var amount: Double; @NSManaged public var name: String? }
