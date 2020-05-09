//
//  ViewController.swift
//  Example iOS
//
//  Created by _name0x07 on _date0x07.
//  Copyright © _year0x07 _name0x07. All rights reserved.
//

import UIKit
import _Template_Project0x07

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "_Template_Project0x07"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = "\(indexPath.item)"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
    }

}

