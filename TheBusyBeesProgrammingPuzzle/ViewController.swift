//
//  ViewController.swift
//  TheBusyBeesProgrammingPuzzle
//
//  Created by Cenker Soyak on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let counter = UILabel()
    var timer = Timer()
    var value = 0
    let indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    func createUI(){
        view.backgroundColor = .white
        
        counter.textAlignment = .center
        counter.textColor = .black
        counter.text = String(0)
        view.addSubview(counter)
        counter.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
            make.height.equalTo(30)
        }
        indicator.startAnimating()
        view.addSubview(indicator)
        indicator.color = .red
        indicator.snp.makeConstraints { make in
            make.top.equalTo(counter.snp.bottom).offset(50)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
            make.height.equalTo(80)
        }
        let button = UIButton()
        button.setTitle("Click for start counting", for: UIControl.State.normal)
        button.backgroundColor = .red
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(indicator.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(40)
            make.right.equalTo(view.snp.right).offset(-40)
            make.height.equalTo(30)
        }
        button.addTarget(self, action: #selector(startCounting), for: UIControl.Event.touchUpInside)
    }
    @objc func startCounting(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerLogic), userInfo: nil, repeats: true)
    }
    @objc func timerLogic(){
        value += 5
        counter.text = String(value)
        if value % 10 == 0{
            indicator.color = UIColor.random()
        }
        if value == 100{
            timer.invalidate()
            indicator.stopAnimating()
            let alert = UIAlertController(title: "Done!", message: "Timer has been finished.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
            present(alert, animated: true)
        }
    }
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}
