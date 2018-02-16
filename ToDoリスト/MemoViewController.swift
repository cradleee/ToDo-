//
//  MemoViewController.swift
//  ToDoリスト
//
//  Created by kamano yurika on 2018/02/14.
//  Copyright © 2018年 釜野由里佳. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveDate : UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveDate.object(forKey: "title") as? String
        contentTextView.text = saveDate.object(forKey: "content") as? String

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo() {
        //UserDefaultsに書き込む
        saveDate.set(titleTextField.text, forKey: "title")
        saveDate.set(titleTextField.text, forKey: "content")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
