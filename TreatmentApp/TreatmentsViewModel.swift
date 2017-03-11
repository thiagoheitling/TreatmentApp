//
//  TreatmentsViewModel.swift
//  TreatmentApp
//
//  Created by Thiago Heitling on 2017-03-10.
//  Copyright © 2017 Thiago Heitling. All rights reserved.
//

import UIKit

class TreatmentsViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let cellID = "cellID"
    var tableView: UITableView?
    var rowHeight: CGFloat = 85
    
    override init() {
        super.init()

        tableView = getTableView()
    }
    
    func getTableView() -> UITableView {
        
        let tableview = UITableView()
        tableview.register(TreatmentCell.self, forCellReuseIdentifier: cellID)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        tableview.allowsMultipleSelection = false
        
        return tableview
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TreatmentCell
        cell.configure()
        return cell
    }
}
