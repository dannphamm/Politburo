//
//  ViewController.swift
//  Politburo
//
//  Created by Dung Pham on 5/16/17.
//  Copyright © 2017 Dung Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var members : [Members] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            
            members = try context.fetch(Members.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let member = members[indexPath.row]
        cell.textLabel?.text = member.name
        cell.imageView?.image = UIImage(data: member.image as! Data)
        return cell
    }
    
}
