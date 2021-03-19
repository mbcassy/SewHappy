//
//  AddFabricViewController.swift
//  SewHappy
//
//  Created by Cassy on 3/19/21.
//

import UIKit
import YPImagePicker

class AddFabricViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        var config = YPImagePickerConfiguration()
        //config.library.maxNumberOfItems = 5
        config.wordings.libraryTitle = "Library"
        config.wordings.cameraTitle = "Camera"
        config.wordings.next = "Next"
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, cancelled in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
            }
            
            if cancelled {
                print("Picker was canceled")
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }

}
