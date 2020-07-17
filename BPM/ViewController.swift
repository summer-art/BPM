//
//  ViewController.swift
//  BPM
//
//  Created by 夏 on 2020/07/05.
//  Copyright © 2020 akane.com. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    var count: Double = 0.00
    
    var timer: Timer!
    var BPM: Double!
    
    //BPM表示用ラベル
    @IBOutlet var labelBpm: UILabel!
    
    //開始時間
    //var startDate = Date.distantPast
    
    
    
    //タップ処理
    @IBAction func tapped(_ sender: UIButton) {
        
        
        if count > 0 {
            
            BPM = 60 / count
            labelBpm.text = String(format: "%.0f", BPM)
            count = 0.00
            
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
            timer.invalidate()
            
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
            
        }
        
        
    }
    @objc func update() {
        count = count + 0.01
        print(count)
        
    }
    
    
   
    @IBAction func memo() {
        if count > 0  {timer.invalidate()
        }
    }
    @IBAction func mamechishiki() {
        if count > 0  {timer.invalidate()
        }
    }
    
    }
    

