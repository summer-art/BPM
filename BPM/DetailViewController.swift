//
//  DetailViewController.swift
//  BPM
//
//  Created by 夏 on 2020/07/16.
//  Copyright © 2020 akane.com. All rights reserved.
//

import UIKit
import NCMB
import PKHUD


class DetailViewController: UIViewController {
    
    var selectedMemo: NCMBObject!
    
   @IBOutlet var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = selectedMemo.object(forKey: "memo") as! String

      
    }
    
    @IBAction func update() {
        selectedMemo.setObject(memoTextView.text, forKey: "memo")
        selectedMemo.saveInBackground { (error) in
            if error != nil {
               HUD.flash(.error, delay: 1.0)

            } else {
                // 成功
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
  
    @IBAction func delete() {
        selectedMemo.deleteInBackground { (error) in
            if error != nil {
              HUD.flash(.error, delay: 1.0)
            } else {
                // 削除成功
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
