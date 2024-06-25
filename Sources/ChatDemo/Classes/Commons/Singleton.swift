//
//  Singleton.swift
//  O2ChatWidget
//
//  Created by Sanjay Kumar on 13/05/2024.
//

import Foundation
import UIKit
import SignalRClient
class Singleton  {
    
    static let sharedInstance = Singleton()
    var myLocalChatDB = DatabaseChat()
    
}
