//
//  AlertControllerExtension.swift
//  提示弹框
//
//  Created by 刘伟 on 2019/11/14.
//  Copyright © 2019 GCET. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    convenience init(title:String?,message:String?,alertControllerStyle:UIAlertController.Style
        ,alertActionTitles:[String],alertActionHandle:((UIAlertAction) -> Void)?) {
        
        self.init(title: title, message: message, preferredStyle: alertControllerStyle)
        for title in alertActionTitles {
            let alertAction = UIAlertAction.init(title:title, style:.default, handler: alertActionHandle)
            if title == "取消" {
                alertAction.setValue(HexColor(hexString: "858687"), forKey: "titleTextColor")
            }
            self.addAction(alertAction)
        }
        
        if alertControllerStyle == .actionSheet {
            let actionSheetCancelAction = UIAlertAction.init(title:"取消", style:.cancel, handler: alertActionHandle)
            self.addAction(actionSheetCancelAction)
        } else {
            self.view.backgroundColor = UIColor.white
            self.view.layer.cornerRadius = 13
        }
    }
}
