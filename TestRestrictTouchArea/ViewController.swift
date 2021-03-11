//
//  ViewController.swift
//  TestRestrictTouchArea
//
//  Created by Tien on 2018/5/14.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet var mainView: MainView!
    var getFrameViews:[UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        getFrameViews = [UIView]()
        getFrameViews.append(self.mainView.button_1)
        getFrameViews.append(self.mainView.button_2)
        let frame = MainModel.getClearArea(views: getFrameViews)
        MainModel.processTeaching(view: self.mainView, blackViewSize: self.view.frame, canBeTouchedArea: frame,teachingCase: .enterPersonInfo)
    }
    @IBAction func centerBtnTouch(_ sender: Any) {
        print("center")
        
        MainModel.removeBlackView(VC: self)
        MainModel.processTeaching(view: self.mainView, blackViewSize: self.mainView.frame, canBeTouchedArea: self.mainView.button_2.frame,teachingCase: .registerConfirm)
        mainView.currentState = state.passwd
        self.mainView.button_1 = UIButton(frame:CGRect(x: 100, y: 100, width: 100, height: 100))
    }
    @IBAction func bottomBtnTouch(_ sender: Any) {
        MainModel.removeBlackView(VC: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

