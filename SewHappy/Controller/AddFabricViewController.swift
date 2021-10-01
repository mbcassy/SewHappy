//
//  AddFabricViewController.swift
//  SewHappy
//
//  Created by Cassy on 3/19/21.
//

import UIKit
import YPImagePicker
import CoreData

class AddFabricViewController: UIViewController {
    
    private var container: NSPersistentContainer!
    private var mainView = AddFabricView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        container = NSPersistentContainer(name: "SewHappy")

        container.loadPersistentStores { storeDescription, error in
            //TODO: update this error handling to display an alert instead
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        let navTitle = UINavigationItem(title: "Add new fabric")
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelPressed))
        navTitle.rightBarButtonItem = saveButton
        navTitle.leftBarButtonItem = cancelButton
        mainView.navBar.setItems([navTitle], animated: false)
        mainView.addImageButton.addTarget(self, action: #selector(addImageButtonPressed), for: .touchDown)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func cancelPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func savePressed() {
        if emptyFields() {
            displayEmptyFieldAlert()
        } else {
            let newFabric = Fabric(context: context)
            newFabric.name = mainView.nameTextField.text!
            newFabric.purchasedFrom = mainView.purchasedFromTextField.text ?? ""
            if let quantity = Double(mainView.quantityTextField.text!) {
                newFabric.quantity = quantity
            } else {
                // handle appropropriately by only showing the number keyboard
                print("Not a valid number: \(mainView.quantityTextField.text!)")
            }
            newFabric.image = Data("face.smiling.fill".utf8)
            
            appDelegate.saveContext()
            print("New fabric saved!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func emptyFields() -> Bool {
        if !mainView.nameTextField.hasText {
            return true
        }
        
        if !mainView.quantityTextField.hasText {
            return true
        }
        return false
    }

    func displayEmptyFieldAlert() {
        //TODO: Write this.
    }
    
    @objc func addImageButtonPressed() {
        print("add image button pressed!")
        //TODO: Add functionality for when the next button is tapped
        //TODO: Add functionality for when the user selects pictures
        var config = YPImagePickerConfiguration()
        config.library.maxNumberOfItems = 5
        config.wordings.libraryTitle = "Library"
        config.wordings.cameraTitle = "Camera"
        config.wordings.next = "Next"
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                case .photo(let photo):
                    print(photo)
                case .video(let video):
                    print(video)
                }
                if cancelled {
                    picker.dismiss(animated: true, completion: nil)
                }
            }
            /* when user taps on done, save info and picture(s) selected and then go back to the
               fabric stash view controller. Do this by popping the new VC, then dismissing the picker*/
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}
