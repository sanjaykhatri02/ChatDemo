//
//  File.swift
//  
//
//  Created by Sanjay Kumar on 25/06/2024.
//

import Foundation
import UIKit

public func createChatViewController() -> ChatViewController? {
//    print("Test...")
    let bundle = Bundle.module
    let storyboard = UIStoryboard(name: "Chat", bundle: bundle)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController
    return viewController
    
}
