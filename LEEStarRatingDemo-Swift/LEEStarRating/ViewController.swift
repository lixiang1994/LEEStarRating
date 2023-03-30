//
//  ViewController.swift
//  LEEStarRating
//
//  Created by 李响 on 2017/3/14.
//  Copyright © 2017年 lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let label = UILabel(frame: .init(x: 0, y: 70, width: view.frame.width, height: 30))
            label.text = "整颗"
            label.font = .systemFont(ofSize: 20)
            label.textAlignment = .center
            view.addSubview(label)
            
            let rating = LEEStarRating(
                frame: .init(x: 15, y: 100, width: view.frame.width - 30, height: 50),
                configuration: .init(
                    count: 10,
                    spacing: 10,
                    maximumScore: 10,
                    minimumScore: 0,
                    touchEnabled: true,
                    slideEnabled: true,
                    mode: .whole
                )
            )
            rating.checkedImage = .init(named: "star_orange")
            rating.uncheckedImage = .init(named: "star_gray")
            rating.currentScoreChange = { value in
                label.text = String(format: "%.4f", value)
            }
            view.addSubview(rating)
        }
        
        
        do {
            let label = UILabel(frame: .init(x: 0, y: 170, width: view.frame.width, height: 30))
            label.text = "半颗"
            label.font = .systemFont(ofSize: 20)
            label.textAlignment = .center
            view.addSubview(label)
            
            let rating = LEEStarRating(
                frame: .init(x: 15, y: 200, width: view.frame.width - 30, height: 50),
                configuration: .init(
                    count: 10,
                    spacing: 10,
                    maximumScore: 10,
                    minimumScore: 0,
                    touchEnabled: true,
                    slideEnabled: true,
                    mode: .half
                )
            )
            rating.checkedImage = .init(named: "star_orange")
            rating.uncheckedImage = .init(named: "star_gray")
            rating.currentScoreChange = { value in
                label.text = String(format: "%.4f", value)
            }
            view.addSubview(rating)
            
            // 设置当前分数
            rating.set(current: 4.46)
        }
        
        do {
            let label = UILabel(frame: .init(x: 0, y: 270, width: view.frame.width, height: 30))
            label.text = "无限制"
            label.font = .systemFont(ofSize: 20)
            label.textAlignment = .center
            view.addSubview(label)
            
            let rating = LEEStarRating(
                frame: .init(x: 15, y: 300, width: view.frame.width - 30, height: 50),
                configuration: .init(
                    count: 10,
                    spacing: 10,
                    maximumScore: 10,
                    minimumScore: 0,
                    touchEnabled: true,
                    slideEnabled: true,
                    mode: .unlimited
                )
            )
            rating.checkedImage = .init(named: "star_orange")
            rating.uncheckedImage = .init(named: "star_gray")
            rating.currentScoreChange = { value in
                label.text = String(format: "%.4f", value)
            }
            view.addSubview(rating)
            
            // 设置当前分数
            rating.set(current: 8.66)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
