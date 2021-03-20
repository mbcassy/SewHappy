//
//  FabricStashViewController.swift
//  SewHappy
//
//  Created by Cassy on 2/23/21.
//

import UIKit
import YPImagePicker

class FabricStashViewController: UIViewController {

    private var mainView = FabricView()
    private var fabricDataDelegateSource = ObjectDataDelegateSource()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.fabricCollectionView.dataSource = fabricDataDelegateSource
        self.mainView.fabricCollectionView.delegate = fabricDataDelegateSource
        self.mainView.fabricCollectionView.register(FabricCell.self, forCellWithReuseIdentifier: FabricCell.identifier)
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLayoutSubviews() {
        self.mainView.addButton.layer.cornerRadius = 0.5 * self.mainView.addButton.bounds.size.width
        self.mainView.addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchDown)
    }
    
    @objc private func addButtonPressed(sender: UIButton) {        
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
                picker.dismiss(animated: true, completion: nil)
            }
            picker.dismiss(animated: true, completion: nil)
            
        }
        present(picker, animated: true, completion: nil)
    }
}
