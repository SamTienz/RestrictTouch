//
//  MainModel.swift
//  TestRestrictTouchArea
//
//  Created by Tien on 2018/5/17.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit
//MARK:enumCase
enum canBeTouchedCase{
    case registerOrFbLogin
    case registerConfirm
    case setPassword
    case setAccount
    case phoneOrMail
    case privacy
    case messageVerify
    case forgetPassword_Phone
    case forgetPassword_Mail
    case diaryBegin
    case tapPersonInfo
    case enterName
    case instruction
    case tapAgree
    case login
    case signUpFb
    case enterPersonInfo
}
class MainModel: NSObject {
    static var teachingView:UIView!
    class func processTeaching(view: UIView ,blackViewSize: CGRect , canBeTouchedArea: CGRect ,teachingCase:canBeTouchedCase) {
        //黑色底層View
        teachingView = UIView(frame: blackViewSize)
        teachingView.alpha = 1
        teachingView.tag = 10
        teachingView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7009645601)
        view.addSubview(teachingView)
        
        let maskLayer = CAShapeLayer()
        let path = CGMutablePath()
        
        
        //-----------------圓角----------------
        //        let radius : CGFloat = 50.0
        //        path.addArc(center: pickingRange, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        //-------------------------------------
        
        
        switch teachingCase {
            
        //MARK:註冊或FB登入頁面
        case .registerOrFbLogin:
            let finger = addFinger(downFinger: true, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.327*view.bounds.height, width: 0.811*view.bounds.width, height: 0.1875*view.bounds.height))
            let str = "使用手機號碼或電子郵件註冊\n請點選 註冊\n\n使用FB帳號註冊\n請點選 FACEBOOK"
            var range = (str as NSString).range(of: "使用手機號碼或電子郵件註冊\n請點選 註冊\n\n使用FB帳號註冊\n請點選 FACEBOOK")
            let attributedString = NSMutableAttributedString(string:str)
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            
            range = (str as NSString).range(of: " 註冊")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            range = (str as NSString).range(of: " FACEBOOK")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            
            //==========透明範圍========== 待調整
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:註冊確認按鈕
        case .registerConfirm:
            let finger = addFinger(downFinger: true, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.6*view.bounds.height, width: 0.811*view.bounds.width, height: 0.0375*view.bounds.height))
            let str = "點擊 確認"
            var range = (str as NSString).range(of: "點擊 確認")
            let attributedString = NSMutableAttributedString(string:str)
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            
            range = (str as NSString).range(of: " 確認")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍==========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:設定密碼
        case .setPassword:
            let finger = addFinger(downFinger: false, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.7*view.bounds.height, width: 0.811*view.bounds.width, height: 0.1125*view.bounds.height))
            let str = "設定 一組密碼\n請輸入由英文字母及數字組成的密碼\n並注意英文字母大小寫的不同"
            var range = (str as NSString).range(of: "設定 一組密碼\n請輸入由英文字母及數字組成的密碼\n並注意英文字母大小寫的不同")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: "設定 ")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            range = (str as NSString).range(of: "英文字母大小寫")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍========== 待調整
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:設定帳號
        case .setAccount:
            let finger = addFinger(downFinger: false, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.46*view.bounds.height, width: 0.811*view.bounds.width, height: 0.1125*view.bounds.height))
            let str = "設定 一組帳號\n請輸入由英文字母及數字組成的帳號\n並注意英文字母大小寫的不同"
            var range = (str as NSString).range(of: "設定 一組帳號\n請輸入由英文字母及數字組成的帳號\n並注意英文字母大小寫的不同")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: "設定 ")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            range = (str as NSString).range(of: "英文字母大小寫")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍==========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:手機或信箱
        case .phoneOrMail:
            let finger = addFinger(downFinger: false, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.817*view.bounds.height, width: 0.811*view.bounds.width, height: 0.0375*view.bounds.height))
            let str = "請輸入您的手機號碼或電子信箱"
            var range = (str as NSString).range(of: "請輸入您的手機號碼或電子信箱")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: "手機號碼")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            range = (str as NSString).range(of: "電子信箱")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍==========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:隱私權
        case .privacy:
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.2*view.bounds.height, width: 0.811*view.bounds.width, height: 0.1875*view.bounds.height))
            let str = "請詳閱 糖易控隱私聲明條款\n\n\n確認條款內容後\n就可以開始使用 糖易控 啦！"
            var range = (str as NSString).range(of: "請詳閱 糖易控 隱私聲明條款\n\n\n確認條款內容後\n就可以開始使用 糖易控 啦！")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 糖易控隱私聲明條款")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            range = (str as NSString).range(of: " 糖易控 ")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            let okBtn = UIButton(frame: CGRect(x: 0.0791*view.bounds.width, y: 0.4625*view.bounds.height, width: 0.8444*view.bounds.width, height: 0.075*view.bounds.height))
            okBtn.setTitle("了解", for: .normal)
            okBtn.backgroundColor = UIColor.clear
            okBtn.setTitleColor(#colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), for: .normal)
            okBtn.layer.borderWidth = 2
            okBtn.layer.borderColor = #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1)
            okBtn.addTarget(self, action: #selector(okBtnAction), for: .touchUpInside)
            teachingView.addSubview(okBtn)
            teachingView.addSubview(textView)
            //==========透明範圍==========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:簡訊驗證
        case .messageVerify:
            let finger = addFinger(downFinger: false, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.663*view.bounds.height, width: 0.811*view.bounds.width, height: 0.0375*view.bounds.height))
            let str = "輸入 驗證碼"
            var range = (str as NSString).range(of: "輸入 驗證碼")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 驗證碼")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍=========== 待修正
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:忘記密碼 手機
        case .forgetPassword_Phone:
            let finger = addFinger(downFinger: false, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.7487*view.bounds.height, width: 0.811*view.bounds.width, height: 0.075*view.bounds.height))
            let str = "點擊 確認\n並檢閱 手機 驗證碼"
            var range = (str as NSString).range(of: "點擊 確認\n並檢閱 手機 驗證碼")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 確認")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            range = (str as NSString).range(of: " 手機 驗證碼")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍=========== 待修正
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:忘記密碼 信箱
        case .forgetPassword_Mail:
            let finger = addFinger(downFinger: false, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.7487*view.bounds.height, width: 0.811*view.bounds.width, height: 0.075*view.bounds.height))
            let str = "點擊 確認\n並檢閱 信箱 驗證碼"
            var range = (str as NSString).range(of: "點擊 確認\n並檢閱 信箱 驗證碼")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 確認")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            range = (str as NSString).range(of: " 信箱 驗證碼")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍=========== 待修正
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:日記開始
        case .diaryBegin:
            let finger = addFinger(downFinger: true, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.685*view.bounds.height, width: 0.811*view.bounds.width, height: 0.0375*view.bounds.height))
            let str = "點擊。。。"
            var range = (str as NSString).range(of: "點擊。。。")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: "。。。")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            let diaryTextView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.2173*view.bounds.height, width: 0.811*view.bounds.width, height: 0.75*view.bounds.height))
            diaryTextView.text = "開始之前\n請先設定您的專屬資訊"
            diaryTextView.font = UIFont.systemFont(ofSize: 18)
            diaryTextView.textColor = UIColor.white
            diaryTextView.backgroundColor = UIColor.clear
            diaryTextView.isEditable = false
            diaryTextView.textAlignment = .center
            teachingView.addSubview(diaryTextView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍===========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:點擊個人資訊
        case .tapPersonInfo:
            let finger = addFinger(downFinger: true, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.323*view.bounds.height, width: 0.811*view.bounds.width, height: 0.0375*view.bounds.height))
            let str = "點擊 個人資訊"
            var range = (str as NSString).range(of: "點擊 個人資訊")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 個人資訊")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍===========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:輸入姓名
        case .enterName:
            let finger = addFinger(downFinger: false, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.375*view.bounds.height, width: 0.811*view.bounds.width, height: 0.0375*view.bounds.height))
            let str = "請輸入您的 姓名"
            var range = (str as NSString).range(of: "請輸入您的 姓名")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 姓名")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍===========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:使用說明
        case .instruction:
            let finger = addFinger(downFinger: true, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.6*view.bounds.height, width: 0.811*view.bounds.width, height: 0.0375*view.bounds.height))
            let str = "點擊 使用說明"
            var range = (str as NSString).range(of: "點擊 使用說明")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 使用說明")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            let instructionTextView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.2173*view.bounds.height, width: 0.811*view.bounds.width, height: 0.75*view.bounds.height))
            instructionTextView.text = "有關各項生理數值的輸入方式\n控糖團、報表等\n詳細的使用說明介紹\n均可在此尋求協助"
            instructionTextView.font = UIFont.systemFont(ofSize: 18)
            instructionTextView.textColor = UIColor.white
            instructionTextView.backgroundColor = UIColor.clear
            instructionTextView.isEditable = false
            instructionTextView.textAlignment = .center
            teachingView.addSubview(instructionTextView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍===========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:點擊同意查看
        case .tapAgree:
            let finger = addFinger(downFinger: true, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.5*view.bounds.height, width: 0.811*view.bounds.width, height: 0.075*view.bounds.height))
            let str = "點擊\n同意隱私權聲明條款 來查看內容"
            var range = (str as NSString).range(of: "點擊\n同意隱私權聲明條款 來查看內容")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: "同意隱私權聲明條款")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍===========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:登入
        case .login:
            let finger = addFinger(downFinger: false, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.786*view.bounds.height, width: 0.811*view.bounds.width, height: 0.075*view.bounds.height))
            let str = "請輸入您所設定的帳號及密碼後\n點選 登入"
            var range = (str as NSString).range(of: "請輸入您所設定的帳號及密碼後\n點選 登入")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 登入")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍===========
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:臉書註冊頁
        case .signUpFb:
//-----------------------第一textView、手指設定-------------------------------
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.525*view.bounds.height, width: 0.811*view.bounds.width, height: 0.0375*view.bounds.height))
            var str = "點擊 查看隱私聲明條款"
            var range = (str as NSString).range(of: "點擊 查看隱私聲明條款")
            var attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 查看隱私聲明條款")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(textView)
            let topFinger = UIImageView(frame: CGRect(x:textView.frame.minX, y:textView.frame.midY - 0.5*0.0796*view.bounds.height , width: 0.0916*view.bounds.width, height: 0.0796*view.bounds.height))
            topFinger.image = #imageLiteral(resourceName: "upFinger")
            teachingView.addSubview(topFinger)
//---------------------------------------------------------------------
//======================第二textView、手指設定============================
            var bottomTextView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.654*view.bounds.height, width: 0.811*view.bounds.width, height: 0.075*view.bounds.height))
            str = "勾選 同意後\n點擊 確認"
            range = (str as NSString).range(of: "勾選 同意後\n點擊 確認")
            attributedString = NSMutableAttributedString(string:str)
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            
            range = (str as NSString).range(of: " 同意後")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            range = (str as NSString).range(of: " 確認")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            bottomTextView = textViewFormatter(str: attributedString, textView: bottomTextView)
            teachingView.addSubview(bottomTextView)
            let bottomFinger = UIImageView(frame: CGRect(x:bottomTextView.frame.minX, y:bottomTextView.frame.midY - 0.5*0.0796*view.bounds.height , width: 0.0916*view.bounds.width, height: 0.0796*view.bounds.height))
            bottomFinger.image = #imageLiteral(resourceName: "path_2")
            teachingView.addSubview(bottomFinger)
//======================================================================
            //==========透明範圍=========== 待修正
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        //MARK:輸入個人資訊
        case .enterPersonInfo:
            let finger = addFinger(downFinger: false, view: view,canBeTouchedArea: canBeTouchedArea)
            var textView = UITextView(frame: CGRect(x: 0.0944*view.bounds.width, y: 0.829*view.bounds.height, width: 0.811*view.bounds.width, height: 0.0375*view.bounds.height))
            let str = "請填寫您的 個人資料"
            var range = (str as NSString).range(of: "請填寫您的 個人資料")
            let attributedString = NSMutableAttributedString(string:str)
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
            range = (str as NSString).range(of: " 個人資料")
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: #colorLiteral(red: 0.1411764706, green: 0.5764705882, blue: 0.9333333333, alpha: 1), range: range)
            
            textView = textViewFormatter(str: attributedString, textView: textView)
            teachingView.addSubview(finger)
            teachingView.addSubview(textView)
            //==========透明範圍=========== 待修正
            path.addRect(canBeTouchedArea)
            //===========================
            path.addRect(teachingView.frame)
        }
        //=============建立透明區域================
        maskLayer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7009645601)
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.path = path
        //=======================================
        teachingView.layer.mask = maskLayer
        teachingView.clipsToBounds = true
        
    }
    @objc class func okBtnAction(){
        teachingView.removeFromSuperview()
    }
    class func removeBlackView(VC:UIViewController){
        for view in VC.view.subviews{
            if view.tag == 10{
                view.removeFromSuperview()
            }
        }
    }
    class func addFinger(downFinger:Bool,view:UIView,canBeTouchedArea: CGRect) -> UIImageView{
        //生成向下手指
        if downFinger{
            let finger = UIImageView(frame: CGRect(x:canBeTouchedArea.midX - 0.5 * 0.0916*view.bounds.width, y: canBeTouchedArea.minY - 1.3*0.0796*view.bounds.height , width: 0.0916*view.bounds.width, height: 0.0796*view.bounds.height))
            finger.image = #imageLiteral(resourceName: "path_2")
            return finger
        //生成向上手指
        }else{
            let finger = UIImageView(frame: CGRect(x:canBeTouchedArea.midX - 0.5 * 0.0916*view.bounds.width , y: canBeTouchedArea.maxY  + 0.3*0.0796*view.bounds.height, width: 0.0916*view.bounds.width, height: 0.0796*view.bounds.height))
            finger.image = #imageLiteral(resourceName: "upFinger")
            return finger
        }
    }
    class func textViewFormatter(str:NSMutableAttributedString,textView:UITextView) -> UITextView{
        textView.attributedText = str
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.backgroundColor = UIColor.clear
        textView.isEditable = false
        textView.isSelectable = false
        textView.textAlignment = .center
        return textView
    }
    class func getClearArea(views:[UIView]) -> CGRect{
        var clearArea:CGRect!
        var minFrameView:UIView!
        var maxFrameView:UIView!
        minFrameView = views[0]
        maxFrameView = views[0]
        for view in views{
            if view.frame.minY < minFrameView.frame.minY{
                minFrameView = view
            }
            if view.frame.maxY > maxFrameView.frame.maxY{
                maxFrameView = view
            }
        }
        clearArea = CGRect(x: minFrameView.frame.minX, y: minFrameView.frame.minY, width: maxFrameView.frame.maxX - minFrameView.frame.minX, height: maxFrameView.frame.maxY - minFrameView.frame.minY)
        return clearArea
    }
}
