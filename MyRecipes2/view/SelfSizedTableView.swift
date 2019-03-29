//
//  SelfSizedTableView.swift
//  MyRecipes2
//
//  Created by Wiktoria on 28/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit

class SelfSizedTableView: UITableView {
    
    
    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
