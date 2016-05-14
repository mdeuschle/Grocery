//
//  RootViewController.swift
//  Grocery
//
//  Created by Matt Deuschle on 5/13/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit
import CoreData

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var recipes = [Recipe]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

    }

    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }

    func fetchAndSetResults() {

        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Recipe")

        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeTableViewCell {

            let recipe = recipes[indexPath.row]
            cell.configureCell(recipe)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}












