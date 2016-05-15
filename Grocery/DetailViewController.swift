//
//  DetailViewController.swift
//  Grocery
//
//  Created by Matt Deuschle on 5/13/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngrediants: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImage: UIImageView!

    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImage.layer.cornerRadius = 4.0
        recipeImage.clipsToBounds = true
        recipeTitle.delegate = self
        recipeIngrediants.delegate = self
        recipeSteps.delegate = self
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        recipeTitle.resignFirstResponder()
        recipeIngrediants.resignFirstResponder()
        recipeSteps.resignFirstResponder()
        return true
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImage.image = image

    }

    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func createRecipe(sender: AnyObject!) {

        if let title = recipeTitle.text where title != "" {

            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)
            let recipe = Recipe(entity: entity!, insertIntoManagedObjectContext: context)
            recipe.title = title
            recipe.ingrediants = recipeIngrediants.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(recipeImage.image!)

            context.insertObject(recipe)

            do {

                try context.save()
            } catch {
                print("Cound not save recipe")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
}

