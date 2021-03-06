//
//  FabricCellCollectionViewCell.swift
//  SewHappy
//
//  Created by Cassy on 3/5/21.
//

import UIKit

class FabricCell: UICollectionViewCell {
    static var identifier: String = "FabricCell"

    weak var textLabel: UILabel!
    weak var bgImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor)
        ])
        self.textLabel = textLabel
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: imageView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
        self.bgImage = imageView
        
        self.reset()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }

    func reset() {
        self.textLabel.textAlignment = .center
        self.bgImage.contentMode = .scaleAspectFill
        self.bgImage.clipsToBounds = true
        self.bgImage.layer.cornerRadius = 12
    }
}
