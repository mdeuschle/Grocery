//
//  RootViewController.swift
//  Grocery
//
//  Created by Matt Deuschle on 5/13/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var recipes = [Recipe]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

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
