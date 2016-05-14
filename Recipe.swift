//
//  Recipe.swift
//  Grocery
//
//  Created by Matt Deuschle on 5/14/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

    func setRecipeImage(img: UIImage) {

        let data = UIImagePNGRepresentation(img)
        self.image = data
    }

    func getRecipeImg() -> UIImage {

        if let img = UIImage(data: self.image!) {
            return img
        } else {
            return UIImage(named: "profile1")!
        }
    }
}
