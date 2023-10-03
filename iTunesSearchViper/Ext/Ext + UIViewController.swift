//
//  Ext + UIViewController.swift
//  iTunesSearchViper
//
//  Created by Рустам Т on 10/3/23.
//

import UIKit

extension UIViewController {
     func showSearchErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Please enter at least 3 characters for the search", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
