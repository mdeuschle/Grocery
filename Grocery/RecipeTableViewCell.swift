//
//  RecipeTableViewCell.swift
//  Grocery
//
//  Created by Matt Deuschle on 5/14/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(recipe: Recipe) {
        recipeTitle.text = recipe.title
        recipeImage.image = recipe.getRecipeImg()
    }


}
