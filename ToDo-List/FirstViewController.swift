//
//  FirstViewController.swift
//  ToDo-List
//
//  Created by Priom on 2015-10-29.
//  Copyright © 2015 Priom.net. All rights reserved.
//

//View your todo page
import UIKit

//Global variable for todo list for total app
var tdList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var listTbl: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        if (UserDefaults.standard.object(forKey: "tdList") != nil) {
            tdList = UserDefaults.standard.object(forKey: "tdList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tdList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = tdList[(indexPath as NSIndexPath).row]
        return cell
    }

    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            tdList.remove(at: (indexPath as NSIndexPath).row)
            UserDefaults.standard.set(tdList, forKey: "tdList")
            listTbl.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        listTbl.reloadData()
    }
}

