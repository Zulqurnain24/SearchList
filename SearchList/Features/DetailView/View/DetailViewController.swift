//
//  DetailViewController.swift
//  SearchList
//
//  Created by Mohammad Zulqurnain on 26/01/2022.
//

import UIKit

protocol DetailViewControllerProtocol {
    func setupDetailView()
    func  setupDetailViewConstraints()
}

class DetailViewController: UIViewController,
                            DetailViewControllerProtocol{

    let detailView = DetailView()
    var detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .white
        setupDetailView()
    }
  
    func setupDetailView() {
        
        guard let itemDetail = detailViewModel.itemDetail else { return }
        detailView.populate(itemDetail: itemDetail)
        setupDetailViewConstraints()
    }
    
    func  setupDetailViewConstraints() {
        view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(IntConstants.horizontalMargin.rawValue)).isActive = true
        detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(IntConstants.horizontalMargin.rawValue)).isActive = true
        detailView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat(IntConstants.horizontalMargin.rawValue)).isActive = true
        detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat(IntConstants.zero.rawValue)).isActive = true
    }
}
