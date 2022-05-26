//
//  ViewController.swift
//  Parallax
//
//  Created by Emil Shpeklord on 24.04.2022.
//

import UIKit
import SnapKit


class ParallaxViewController: UIViewController {

    var heightConstraint: Constraint?

    private lazy var headerView = HeaderView()

    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        return tableView
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.standardAppearance.backgroundColor = .clear
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "video")
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: "descr")
        view.backgroundColor = .systemBackground

        setUpUI()
    }

    func setUpUI() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        var headerFrame = CGRect()
        if (UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0) > 20 {
            headerFrame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.455)
        } else {
            headerFrame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.467)
        }
        headerView = HeaderView.init(frame: headerFrame)
        tableView.tableHeaderView = headerView
    }
}

extension ParallaxViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "video",
                for: indexPath
            ) as? VideoTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "descr",
                for: indexPath
            ) as? DescriptionTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        editNavBar()
        var offsetY = -tableView.contentOffset.y
        heightConstraint = headerView.imageHeightConstraint
        if offsetY > 300 {
            offsetY = 100
            tableView.contentOffset = CGPoint(x: 0, y: -offsetY)
        }
        let newHeight = max(
            headerView.bounds.height - headerView.headerImageHeightOffset,
            headerView.bounds.height + offsetY - headerView.headerImageHeightOffset)
        heightConstraint?.update(offset: newHeight)
    }

    
    private func editNavBar() {
        if self.tableView.contentOffset.y <= 10 {
            self.hideNavBar()
        } else {
            self.showNavbar()
        }
    }

    func hideNavBar() {
        navigationController?.navigationBar.standardAppearance.backgroundColor = .clear
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .clear
    }

    func showNavbar(with color: UIColor = .clear) {
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = color
            self.navigationController?.navigationBar.tintColor = .white
        }, completion: nil)
    }
}
