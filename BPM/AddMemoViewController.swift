//
//  AddMemoViewController.swift
//  BPM
//
//  Created by 夏 on 2020/07/15.
//  Copyright © 2020 akane.com. All rights reserved.
//

import UIKit
import NCMB

class AddMemoViewController: UIViewController {
    @IBOutlet var memoTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        memoTextView.becomeFirstResponder()
    }
    
    @IBAction func save() {
        let object = NCMBObject(className: "Memo")
        object?.setObject(memoTextView.text, forKey: "memo")
        object?.saveInBackground({ (error) in
            if error != nil {
                print(error)
            } else {
                let alertController = UIAlertController(title: "保存完了", message: "メモの保存が完了しました。メモ一覧に戻ります。", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in self.navigationController?.popViewController(animated: true)})
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }

}
