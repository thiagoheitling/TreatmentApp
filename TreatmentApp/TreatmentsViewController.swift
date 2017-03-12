//
//  TreatmentsViewController.swift
//  TreatmentApp
//
//  Created by Thiago Heitling on 2017-03-10.
//  Copyright © 2017 Thiago Heitling. All rights reserved.
//

import UIKit

class TreatmentsViewController: UIViewController {
    
    var treatmentsViewModel = TreatmentsViewModel()
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "TREATMENTS"
                
        if let tableView = treatmentsViewModel.tableView {
            
            // TableView delegate and datasource are handled in the view model.
            self.tableView?.delegate = treatmentsViewModel
            self.tableView?.dataSource = treatmentsViewModel
            self.tableView = tableView
            self.tableView?.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(tableView)
        }
        
        setupTableView()
    }
    
    func setupTableView() {
        
        guard let tableview = tableView else { return }
        
        // x, y, width, height constraints
        tableview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

