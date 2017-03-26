//
//  Controller_SendForm.swift
//  ITrip
//
//  Created by Özgün on 25.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0


class Controller_SendForm: UIViewController,TagDelegate {
    
    
    var c_View : View_SendForm?
    let formatter = NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let btnName = UIButton()
        btnName.setImage(UIImage(named: "left"), forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 30, 30)
        btnName.addTarget(self, action: "actionForLeft:", forControlEvents: .TouchUpInside)
        
        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName
        self.navigationItem.leftBarButtonItem = rightBarButton

        
        
        self.navigationBackGroundColor(UIColor.flatSkyBlueColor(), tintC: UIColor.whiteColor())
        self.c_View = View_SendForm(frame: self.view.frame, target: self)
        self.view.addSubview(self.c_View!)
        
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.dateFormat = "yyyy-MM-dd hh:mm"
        
        self.navigationController!.navigationBar.topItem!.title = "";
        
        
    }
    
    // Tag Delegate
    func returnSelectedTag(tag: [String]) {
        
        print(tag)
    }
    
    //MARK: - Action for Date
    func actionForDate(sender:UIButton){
        
        ActionSheetDatePicker.showPickerWithTitle("Tarih Seçiniz.", datePickerMode: UIDatePickerMode.DateAndTime, selectedDate: NSDate(), doneBlock: { (picker, obj, obj2) in
            
            
            
            
            let date = obj as! NSDate
            
             let nowDate = self.formatter.stringFromDate(date)
            self.c_View?.btn_data.setTitle(nowDate, forState: UIControlState.Normal)
            
            print("ok")
            
            }, cancelBlock: { (cancel) in
                
            }, origin: sender)
    }
    
    func actionForLeft(sender:UIButton){
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }

  
}
























