//
//  ViewController.swift
//  提示弹框
//
//  Created by 刘伟 on 2019/11/14.
//  Copyright © 2019 GCET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let type = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertController() {
        if type == 0 {
            let alertController = UIAlertController.init(title:"hello", message:"world", alertControllerStyle:.alert, alertActionTitles: ["取消","确认"]) { (alertAction) in
                print(alertAction.title!)
            }
            self.present(alertController, animated: true, completion: nil)
        } else if type == 1 {
            let actionSheet = UIAlertController.init(title: "hello", message: nil, alertControllerStyle: .actionSheet, alertActionTitles: ["相册","相机"]) { (alertAction) in
                print(alertAction.title!)
            }
            self.present(actionSheet, animated: true, completion: nil)
        }
    }
}

