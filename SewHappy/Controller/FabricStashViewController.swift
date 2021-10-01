//
//  FabricStashViewController.swift
//  SewHappy
//
//  Created by Cassy on 2/23/21.
//

import UIKit
import YPImagePicker
import CoreData

class FabricStashViewController: UIViewController {

    private var mainView = FabricCollectionView()
    var fabricStash = [Fabric]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.fabricCollectionView.dataSource = self
        self.mainView.fabricCollectionView.delegate = self
        self.mainView.fabricCollectionView.register(FabricCell.self, forCellWithReuseIdentifier: FabricCell.identifier)
        //deleteAll()
        loadSavedFabric()
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLayoutSubviews() {
        //TODO: Extract this to FabricCollectionView
        // mainView.addButton()
        self.mainView.addButton.layer.cornerRadius = 0.5 * self.mainView.addButton.bounds.size.width
        self.mainView.addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchDown)
    }
    
    @objc private func addButtonPressed(sender: UIButton) {
        let newVC = AddFabricViewController()
        self.present(newVC, animated: true, completion: nil)
    }
    
    func loadSavedFabric() {
        let request = Fabric.createFetchRequest()
        let sort = NSSortDescriptor(key: "name", ascending: false)
        request.sortDescriptors = [sort]

        do {
            fabricStash = try appDelegate.persistentContainer.viewContext.fetch(request)
            print("Got \(fabricStash.count) fabrics")
            self.mainView.fabricCollectionView.reloadData()
        } catch {
            print("Fetch failed")
        }
    }
    
    func deleteAll() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Fabric")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
        } catch let error as NSError {
            // TODO: handle the error
            print(error.localizedDescription)
        }
    }
}

extension FabricStashViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fabricStash.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FabricCell.identifier, for: indexPath) as! FabricCell
             
        let fabric = self.fabricStash[indexPath.item]
        cell.fabric = fabric
        cell.backgroundColor = .systemPink
        return cell
    }
}

extension FabricStashViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // add code here for fabric cell selection
    }
}

extension FabricStashViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16
        let spacing:CGFloat = 16

        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        let collection = collectionView
        let width = (collection.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let spacing:CGFloat = 16
        return UIEdgeInsets(top: spacing,left: spacing, bottom: spacing,right: spacing)
    }
}
