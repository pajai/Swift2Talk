//
//  ViewController.swift
//  Swift2
//
//  Created by Patrick Jayet on 22/06/15.
//  Copyright © 2015 Extrabright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let my = MyClass()
        
        let str1 = my.toString1(5)
        let str2 = my.toString2(6)
        let str3 = my.toString3(7)
        
        print("some strings \(str1), \(str2), \(str3)")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "someMethod", name:UIApplicationDidBecomeActiveNotification, object: nil)
    }

    func someMethod () {
        NSLog("App did become active")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func plusOne(n: Int) -> Int {
        return n + 1
    }
}

