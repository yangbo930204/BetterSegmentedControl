//
//  ViewController.swift
//  BetterSegmentedControl
//
//  Created by George Marmaridis on 04/03/2016.
//  Copyright (c) 2016 George Marmaridis. All rights reserved.
//

import BetterSegmentedControl
import UIKit

class ViewController: UIViewController {
    @IBOutlet var control1: BetterSegmentedControl!
    @IBOutlet var control2: BetterSegmentedControl!
    @IBOutlet var control3: BetterSegmentedControl!
    // 创建包含文字和图片的 NSMutableAttributedString
    private func createAttributedString(withText text: String, withImageString image: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)

        if let image = UIImage(named: image) {
            let attachment = NSTextAttachment()
            attachment.image = image

            // 设置图片的尺寸
            let imageAspectRatio = image.size.height / image.size.width
            let imageHeight: CGFloat = 20.0
            let imageWidth: CGFloat = imageHeight / imageAspectRatio
            attachment.bounds = CGRect(x: 0, y: -5, width: imageWidth, height: imageHeight)

            let imageString = NSAttributedString(attachment: attachment)

            // 插入图片到富文本的开头
            attributedString.insert(NSAttributedString(string: " "), at: 0) // 添加一个空格
            attributedString.insert(imageString, at: 0)
        }

        return attributedString
    }

    // MARK: - Examples

    override func viewDidLoad() {
        super.viewDidLoad()
        let facebook = createAttributedString(withText: "facebook", withImageString: "nor_facebook")
        let facebookSelected = createAttributedString(withText: "facebook", withImageString: "facebook")

        let twitter = createAttributedString(withText: "twitter", withImageString: "normal_coin")
        let twitterSelected = createAttributedString(withText: "twitter", withImageString: "selected_coin")

        let navigationSegmentedControl = BetterSegmentedControl(
            frame: CGRect(x: 0, y: 0, width: 300.0, height: 30.0),
            segments: LabelSegment.segments(withNormalTitles: [facebook, twitter],
                                            withSelectedTitles: [facebookSelected, twitterSelected],
                                            normalTextColor: .lightGray,
                                            selectedTextColor: .white),
            options: [.backgroundColor(.darkGray),
                      .indicatorViewBackgroundColor(UIColor(red: 0.36, green: 0.38, blue: 0.87, alpha: 1.00)),
                      .cornerRadius(3.0),
                      .animationSpringDamping(1.0)])
        navigationSegmentedControl.addTarget(self,
                                             action: #selector(ViewController.navigationSegmentedControlValueChanged(_:)),
                                             for: .valueChanged)

        navigationSegmentedControl.firstItemAddWidth = 20

        navigationItem.titleView = navigationSegmentedControl

        // Control 1: Created and designed in IB
//        control1.segments = LabelSegment.segments(withTitles: ["Recent", "Nearby", "All"],
//                                                  normalTextColor: UIColor(red: 0.48, green: 0.48, blue: 0.51, alpha: 1.00))

        // Control 2: Created and designed in IB
//        control2.segments = LabelSegment.segments(withTitles: ["Music", "Movies", "Apps"],
//                                                  normalTextColor: .white,
//                                                  selectedTextColor: UIColor(red: 0.92, green: 0.29, blue: 0.15, alpha: 1.00))

        // Control 3: Many options
//        control3.segments = LabelSegment.segments(withTitles: ["One", "Two", "Three", "Four", "Five"],
//                                                  normalFont: .systemFont(ofSize: 14.0),
//                                                  normalTextColor: UIColor(red: 0.15, green: 0.39, blue: 0.96, alpha: 0.9),
//                                                  selectedFont: .systemFont(ofSize: 14.0),
//                                                  selectedTextColor: UIColor(red: 0.16, green: 0.40, blue: 0.96, alpha: 1.00))

        // Control 4: Created and designed in IB, self-sizing

//         Control 5: Basic Icons
//        let iconsSegmentedControl = BetterSegmentedControl(
//            frame: CGRect(x: 0.0, y: 380.0, width: 160, height: 30.0),
//            segments: IconSegment.segments(withIcons: [UIImage(named: "facebook")!, UIImage(named: "twitter")!],
//                                           iconSize: CGSize(width: 20.0, height: 20.0),
//                                           normalIconTintColor: .white,
//                                           selectedIconTintColor: UIColor.red),
//            options: [.cornerRadius(15.0),
//                      .backgroundColor(UIColor(red: 0.16, green: 0.64, blue: 0.94, alpha: 1.00)),
//                      .indicatorViewBackgroundColor(.white)])
//        iconsSegmentedControl.center.x = view.center.x
//        view.addSubview(iconsSegmentedControl)

        // Control 6: Apple style
        let appleStyledControl: BetterSegmentedControl = .appleStyled(frame: CGRect(x: 16.0,
                                                                                    y: 435,
                                                                                    width: view.bounds.width - 32.0,
                                                                                    height: 32.0),
                                                                      titles: [NSAttributedString(string: "First"), NSAttributedString(string: "First"), NSAttributedString(string: "First")])
        view.addSubview(appleStyledControl)

        // Control 7: No initially selected segment
//        let noSelectedSegmentControl = BetterSegmentedControl(
//            frame: CGRect(x: 16.0, y: 490, width: view.bounds.width - 32.0, height: 44.0),
//            segments: LabelSegment.segments(withTitles: ["One", "Two", "Three", "Four"]),
//            index: -1)
//        noSelectedSegmentControl.addTarget(self, action: #selector(segmentedControl1ValueChanged(_:)), for: .valueChanged)
//        view.addSubview(noSelectedSegmentControl)
    }

    // MARK: - Action handlers

    @objc func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
        if sender.index == 0 {
            print("Turning lights on.")
            if #available(iOS 13.0, *) {
                view.backgroundColor = .systemGray5
            } else {
                view.backgroundColor = .white
            }
        } else {
            print("Turning lights off.")
            view.backgroundColor = .darkGray
        }
    }

    @IBAction func segmentedControl1ValueChanged(_ sender: BetterSegmentedControl) {
        print("The selected index is \(sender.index)")
    }
}
