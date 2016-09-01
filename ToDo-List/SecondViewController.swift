//
//  SecondViewController.swift
//  ToDo-List
//
//  Created by Priom on 2015-10-29.
//  Copyright © 2015 Priom.net. All rights reserved.
//

//Add New ToDo page
import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var todoTxt: UITextField!

    @IBAction func addBtn(_ sender: AnyObject) {
        tdList.append(todoTxt.text!)
        todoTxt.text = ""
        UserDefaults.standard.set(tdList, forKey: "tdList")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {
        todoTxt.resignFirstResponder()
        return true
    }


// Default func
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

