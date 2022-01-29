//
//  ListViewController.swift
//  SearchList
//
//  Created by Mohammad Zulqurnain on 26/01/2022.
//
import UIKit

protocol ListViewControllerProtocol {
    func setupTitle()
    func setupViewModel()
    func setupTableView()
    func setupSearchBar()
    func loadData(fileName: String?, failureHandler: ((String) -> Void)?)
}

class ListViewController: UIViewController,
                          ListViewControllerProtocol,
                          Alertable {
   
    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    let listViewModel = ListViewModel()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupNavigationBarAppearance()
        setupTitle()
        setupViewModel()
        setupTableView()
        setupSearchBar()
        loadData { [weak self] errorMessage in
            self?.showAlert(title: StringConstants.errorAlertTitle.rawValue, message: errorMessage, preferredStyle: .alert)
        }
    }

    func setupNavigationBarAppearance() {
        navigationController?.navigationBar.tintColor = .black
    }
    
    func setupTitle() {
        
        let label = UILabel()
        label.text = StringConstants.searchTitle.rawValue
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    func setupViewModel() {
        
        listViewModel.refreshCompletionHandler = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListItemCell.self, forCellReuseIdentifier: "\(ListItemCell.self)")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
 
    func loadData(fileName: String? = nil, failureHandler: ((String) -> Void)? = nil) {
        
        listViewModel.fetchData(fileName: fileName) { errorMessage in
            failureHandler?(errorMessage)
        }
    }
    
}

extension ListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = .black
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        StringConstants.tableTitle.rawValue
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listViewModel.itemList.items?.count ?? IntConstants.zero.rawValue
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        guard let listItem = listViewModel.itemList.items?[row] else { return }
        let detailViewController = DetailViewController()
        detailViewController.modalPresentationStyle = .fullScreen
        detailViewController.detailViewModel = DetailViewModel(itemDetail: ListItemDetail(title: listItem.title, detail: listItem.detail))
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        guard let listItems = listViewModel.itemList.items,
              let cell = tableView.dequeueReusableCell(withIdentifier: "\(ListItemCell.self)", for: indexPath) as? ListItemCell
        else { return UITableViewCell() }
        
        cell.padding = IntConstants.padding.rawValue
        cell.populate(with: listItems[row])
        cell.accessoryType = .none
        cell.selectionStyle = .none
        return cell
    }

}

extension  ListViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        
        searchController.searchBar.layer.borderColor = UIColor.black.cgColor
        searchController.searchBar.searchTextField.layer.borderWidth = CGFloat(IntConstants.borderWidth.rawValue)
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.searchTextField.layer.cornerRadius = CGFloat(IntConstants.cornerRadius.rawValue)
        searchController.searchBar.searchTextField.clipsToBounds = true
        searchController.searchBar.searchTextField.leftView?.isHidden = true
        UISearchBar.appearance().searchTextPositionAdjustment = UIOffset(horizontal: CGFloat(IntConstants.searchBarPlaceHolderXOffset.rawValue), vertical: CGFloat(IntConstants.zero.rawValue))
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: StringConstants.searchField.rawValue) as? UITextField
        textFieldInsideSearchBar?.placeholder = StringConstants.exampleSearchText.rawValue
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        listViewModel.fetchData(searchTerm: searchController.searchBar.text) { [weak self] errorMessage in
            
            self?.showAlert(title: StringConstants.errorAlertTitle.rawValue, message: errorMessage, preferredStyle: .alert)
        }
    }
    
}
