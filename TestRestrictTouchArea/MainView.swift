//
//  MainView.swift
//  TestRestrictTouchArea
//
//  Created by Tien on 2018/5/16.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit
enum state{
    case num
    case passwd
}
class MainView: UIView {
    
    @IBOutlet weak var button_1: UIButton!
    var text = ""
    @IBOutlet weak var button_2: UIButton!
    var currentState: state?
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        switch currentState {
        case .num?:
            let btn_1_Point = button_1.convert(point, from: self)
            guard button_1.point(inside: btn_1_Point, with: event) else {
                return super.hitTest(point, with: event)
            }
            return button_1
        case .passwd?:
            let btn_2_Point = button_2.convert(point, from: self)
            guard button_2.point(inside: btn_2_Point, with: event) else {
                return super.hitTest(point, with: event)
            }
            return button_2
        default:
            return UIView()
        }
    }
    override func draw(_ rect: CGRect) {
        currentState = state.num
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
