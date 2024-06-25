

//
//  File.swift
//
//
//  Created by Sanjay Kumar on 25/06/2024.
//

import Foundation

import UIKit
import FMDB

public func createChatViewController() -> ChatViewController? {
//    print("Test...")
    
    let bundle = Bundle.module
    let storyboard = UIStoryboard(name: "MainChat", bundle: bundle)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController
    return viewController
    
}

public func createDatabase(){
    var dbChatObj = Singleton.sharedInstance.myLocalChatDB
    dbChatObj.CreateChatDatabase()
}
