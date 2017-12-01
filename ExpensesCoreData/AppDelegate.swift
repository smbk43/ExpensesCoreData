//
//  AppDelegate.swift
//  ExpensesCoreData
//
//  Created by Sean Buchholz on 12/1/17.
//  Copyright © 2017 Sean Buchholz. All rights reserved.
//

import UIKit
import CoreData
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true }
    func applicationWillTerminate(_ application: UIApplication) {
        // application ends, goodbye
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // when application is closed, application will pause
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        // calls resources to enable app resume
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        // clears all resources used
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        // restart all aspects of the app
    }
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = { let container = NSPersistentContainer(name: "ExpensesCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? { fatalError("Unresolved error \(error), \(error.userInfo)") } })
        return container }()
    // MARK: - Core Data Saving support
    func saveContext () { let context = persistentContainer.viewContext
        if context.hasChanges { do { try context.save() } catch { let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)") } } } }

