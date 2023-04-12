//
//  AdjustedHeightTableView.swift
//  test_scrollview
//
//  Created by Trung Dung Le Tran on 12/04/2023.
//

import Foundation
import UIKit

class AdjustedHeightTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}
