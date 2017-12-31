//
//  DetailsViewController.swift
//  TodoListApp
//
//  Created by Robert Argume on 2017-12-30.
//  Copyright © 2017 Robert Argume. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: Utils.rgbHexaComponentToDecimal("DD"),
                                                                   green: Utils.rgbHexaComponentToDecimal("2D"),
                                                                   blue: Utils.rgbHexaComponentToDecimal("01"), alpha: 1)
        
        //navigationController?.navigationBar.prefersLargeTitles = false
        
        //self.navigationController?.navigationBar.topItem?.title = "Task Details"
        navigationController?.navigationBar.tintColor = UIColor.white
        
        
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 26, weight: .semibold)
            
        ]
        
        navigationController?.navigationBar.titleTextAttributes = attrs
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(CGFloat(-10), for: UIBarMetrics.default)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
