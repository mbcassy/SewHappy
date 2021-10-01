//
//  FabricCellCollectionViewCell.swift
//  SewHappy
//
//  Created by Cassy on 3/5/21.
//

import UIKit

class FabricCell: UICollectionViewCell {
    static var identifier: String = "FabricCell"
    
    var fabric: Fabric? {
        didSet {
            //TODO: figure out why image is not loading?
            textLabel.text = fabric?.name
            //guard let imageData = fabric?.image  else { return }
            /*if let data = fabric?.image as Data? {
                bgImage.image = UIImage(data: data)
            } else {
                bgImage.image = UIImage(systemName: "face.smiling.fill")
            }*/
            self.bringSubviewToFront(textLabel)
        }
    }
    
    private var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private var bgImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        //image.image = UIImage(systemName: "face.smiling.fill")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    private func setupConstraints() {
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.bgImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        self.contentView.addSubview(bgImage)
        
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: bgImage.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: bgImage.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: bgImage.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: bgImage.bottomAnchor)
        ])
    }
}
