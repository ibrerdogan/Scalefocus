//
//  KeyboardResponder.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 16.12.2022.
//

import Foundation
import SwiftUI

//MARK: code from https://github.com/BLCKBIRDS/Prevent-keyboard-from-hiding-SwiftUI-views
//respect :)

class KeyboardResponder: ObservableObject {
    
    
    @Published var currentHeight: CGFloat = 0
    
  
    var _center: NotificationCenter
    
    init(center: NotificationCenter = .default) {
        _center = center
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            withAnimation {
               currentHeight = keyboardSize.height
            }
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        withAnimation {
           currentHeight = 0
        }
    }
}

