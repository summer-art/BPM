//
//  ListViewController.swift
//  BPM
//
//  Created by 夏 on 2020/07/15.
//  Copyright © 2020 akane.com. All rights reserved.
//
import UIKit
import NCMB

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var memoArrey = [NCMBObject]()
    @IBOutlet var memoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.dataSource = self
        memoTableView.delegate = self
       
        memoTableView.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        loadDate()
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArrey.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = memoArrey[indexPath.row].object(forKey: "memo") as? String
        return  cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面の取得(Dtail)
        if segue.identifier == "toDetail" {
            let detailViewController = segue.destination as! DetailViewController
            let selectedIndex = memoTableView.indexPathForSelectedRow!
            detailViewController.selectedMemo = memoArrey[selectedIndex.row]
        }
       
    }
    
    func loadDate() {
         let query = NCMBQuery(className: "Memo")
               query?.findObjectsInBackground({ (result, error) in
                   if error != nil {
                       print(error)
                   } else {
                       self.memoArrey = result as! [NCMBObject]
                       self.memoTableView.reloadData()
                   }
               })    }
    
    
    
    
}
