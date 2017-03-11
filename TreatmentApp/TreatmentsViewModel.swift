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
    
    var treatments = [Treatment]()
    
    let contentManager = ContentManager.sharedInstance
    
    override init() {
        super.init()        
        
        tableView = getTableView()
        loadTreatments()
    }
    
    func loadTreatments() {
        
        contentManager.loadTreatments { (treatments, error) in
            
            if error != nil {
                
                print("[TREATMENTS_VIEW_MODEL] unable to load treatments, error = \(error)")
                return
            }
            
            DispatchQueue.main.async {
                
                self.treatments = treatments
                
                guard let tableView = self.tableView else { return }
                tableView.reloadData()
            }
        }
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
        return treatments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TreatmentCell
        
        let treatment = treatments[indexPath.row]
        cell.configure(with: treatment)
        return cell
    }
}
