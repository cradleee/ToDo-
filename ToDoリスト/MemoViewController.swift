//
//  MemoViewController.swift
//  ToDoリスト
//
//  Created by kamano yurika on 2018/02/14.
//  Copyright © 2018年 釜野由里佳. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
   //@IBOutlet weak var paramLabel: UILabel!
    
    //パラーメータ受取用プロパティ
    //var param:String = "init param"
    
    var saveDate : UserDefaults = UserDefaults.standard
    var todoArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        ///パラメータのバインド
        //self.paramLabel.text = self.param
        
        titleTextField.text = saveDate.object(forKey: "title") as? String
        contentTextView.text = saveDate.object(forKey: "content") as? String
        titleTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backFromView(segue:UIStoryboardSegue){
        NSLog("MemoViewController#backFromView")
    }
    
    @IBAction func saveMemo() {
        //UserDefaultsに書き込む
        if saveDate.object(forKey: "todo") == nil {
            return
            
        }else{
            
            todoArray = saveDate.object(forKey: "todo") as! [String]
            
            todoArray.append(String(describing: titleTextField.text))
            
            saveDate.set(todoArray, forKey: "todo")
            
            //alertを出す
            let alert: UIAlertController = UIAlertController(title: "保存", message: "メモが完了しました。", preferredStyle: .alert)
            
            //OKボタン
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { action in
                        //ボタンが押されたときの動作
                        self.navigationController?.popViewController(animated: true)
                        print("OKボタンが押されました！")
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                textField.resignFirstResponder()
                return true
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //画面遷移
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //var MemoViewController:MemoViewController = segue.destinationViewController as
            //MemoViewController.param = self.paramText.text
    }
    
    //func shouldPerformSegue(withIdentifier: String?, sender: AnyObject?)
    //return true
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

