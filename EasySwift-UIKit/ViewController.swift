

import UIKit

class ViewController: UIViewController{
    let parallVC = ParallaxViewController()
    private var collectionView: UICollectionView?
    var cells = [CellModel]()
    private var filteredCV = [CellModel]()
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupSearchController()
    }
    
    func cvLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 350, height: 240)
        layout.minimumLineSpacing = 40
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionLayout.createCompositionalLayout.createLayout())
        guard let collectionView = collectionView else {
            return
        }
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseId)
        collectionView.backgroundColor =  UIColor(named: "lightGray")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }
    
    func set(cells: [CellModel]) {
        self.cells = cells
    }
    
    func setUpView(){
        title = "Собеседование"
        view.backgroundColor = UIColor(named: "lightGray")
        navigationController?.navigationBar.standardAppearance.backgroundColor = .white
        cvLayout()
            collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        set(cells: CellModel.fetchBottomCells())
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
   }
    
    private var searchBarIsEmpty: Bool {
        guard  let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        contentFilterForSearchText(searchController.searchBar.text!)
    }
    private func contentFilterForSearchText(_ searchText:String) {
        filteredCV = cells.filter({(cellModel: CellModel) -> Bool in
            return cellModel.name.lowercased().contains(searchText.lowercased())
        })
        collectionView?.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCV.count
        }
        else {
        return cells.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseId, for: indexPath) as! MyCollectionViewCell
        var filterCV: CellModel
        if isFiltering {
            filterCV = filteredCV[indexPath.row]
        }
        else {
            filterCV = cells[indexPath.row]
        }
        cell.labelName.text = filterCV.name
        cell.labelDate.text = filterCV.date
        cell.labelTime.text = filterCV.time
        cell.imageView.image = filterCV.image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        parallVC.modalPresentationStyle = .fullScreen
        parallVC.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(parallVC, animated: true)
        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.tintColor = .white
        navigationItem.backBarButtonItem = backItem
//        present(parallVC, animated: true)
        print("выбрана ячейка \(indexPath.row)")
    }
}


 



    


