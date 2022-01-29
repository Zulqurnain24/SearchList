//
//  DetailView.swift
//  SearchList
//
//  Created by Mohammad Zulqurnain on 27/01/2022.
//

import UIKit

protocol DetailViewProtocol: UIView {
    func populate(itemDetail: ListItemDetail)
    func setupViews()
    func setupConstraints()
    func setupTitleLabelConstraints()
    func setupDescriptionLabelConstraints()
}

class DetailView: UIView,
                  DetailViewProtocol {

    let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: IntConstants.zero.rawValue, y: IntConstants.zero.rawValue, width: IntConstants.labelDefaultWidth.rawValue, height: IntConstants.labelDefaultHeight.rawValue))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()

    let descriptionLabel: UILabel  = {
        let descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: IntConstants.labelDefaultWidth.rawValue, height: IntConstants.labelDefaultHeight.rawValue))
        descriptionLabel.font = UIFont.systemFont(ofSize: 14.0)
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func populate(itemDetail: ListItemDetail) {
        titleLabel.text = itemDetail.title
        descriptionLabel.text = itemDetail.detail
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }

    func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        setupTitleLabelConstraints()
        setupDescriptionLabelConstraints()
    }

    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat(IntConstants.horizontalMargin.rawValue)).isActive = true
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: CGFloat(IntConstants.horizontalMargin.rawValue)).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -CGFloat(IntConstants.horizontalMargin.rawValue)).isActive = true
        let _ = titleLabel.heightAnchor.constraint(equalToConstant: CGFloat(IntConstants.descriptionLabelHeight.rawValue))
        titleLabel.sizeToFit()
    }

    func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(IntConstants.horizontalMargin.rawValue)).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat(IntConstants.horizontalMargin.rawValue)).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -CGFloat(IntConstants.horizontalMargin.rawValue)).isActive = true
        let _ = descriptionLabel.heightAnchor.constraint(equalToConstant: CGFloat(IntConstants.descriptionLabelHeight.rawValue))
        descriptionLabel.sizeToFit()
    }

}
