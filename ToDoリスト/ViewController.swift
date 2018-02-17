//
//  ViewController.swift
//  ToDoリスト
//
//  Created by kamano yurika on 2018/02/14.
//  Copyright © 2018年 釜野由里佳. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    //storyBoardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    //配列作る
    var memoNameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くよ、という設定
        table.dataSource = self
        
        //memoNameArrayにメモの題名を入れていく
        memoNameArray = ["メモ", "メモ２", "メモ３"]
    }
    
    @IBAction func backFromMemoView(segue:UIStoryboardSegue){
        NSLog("ViewController#backFromMemoView")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数をmemoNameArrayの数にする
        return memoNameArray.count
    }
    
    //ID付けのセルを取得して、セル付属のtextLableに「テスト」と表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにmemoNameArrayの曲名を表示する
        cell?.textLabel?.text = memoNameArray [indexPath.row]
        
        return cell!
        
    }


}

