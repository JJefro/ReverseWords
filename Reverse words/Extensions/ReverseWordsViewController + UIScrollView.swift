//
//  ReverseWordsViewController + UIScrollView.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 01/10/2021.
//

import UIKit

extension ReverseWordsViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}
