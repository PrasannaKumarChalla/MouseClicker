//
//  MouseLocationProvider.swift
//  MouseClickerApp
//
//  Created by Prasanna challa on 10/19/19.
//  Copyright © 2019 Prasanna challa. All rights reserved.
//

import Foundation
import Cocoa

/// Provides Location of mouse
class MouseLocationProvider {
    
    /// Provides location of next mouse right click
    /// - Parameter completion: Completion block to run after execution
    class func nextMouseClickLocation(completion: @escaping (_ location: NSPoint) -> Void){
        NSEvent.addGlobalMonitorForEvents(matching: .rightMouseDown) { _ in
            completion(NSEvent.mouseLocation)
        }
    }
}
