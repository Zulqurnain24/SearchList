//
//  ListItemCell.swift
//  SearchList
//
//  Created by Mohammad Zulqurnain on 26/01/2022.
//

import UIKit

protocol ListItemCellProtocol {
    func populate(with listItem: ListItem)
    func customizeContentView()
}

class ListItemCell: UITableViewCell,
                    ListItemCellProtocol {

    var padding: Int?
    
    override init(style: UITableViewCell.CellStyle = .subtitle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        customizeContentView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(with listItem: ListItem) {
        textLabel?.text = listItem.title
        detailTextLabel?.text = listItem.description
    }

    func customizeContentView() {
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = CGFloat(IntConstants.borderWidth.rawValue)
    }
  
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let padding = padding else { return }
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: CGFloat(padding), left: CGFloat(padding), bottom: CGFloat(IntConstants.zero.rawValue), right: CGFloat(padding)))
    }
}
