//
//  RepeatClicker.swift
//  MouseClickerApp
//
//  Created by Prasanna challa on 10/19/19.
//  Copyright © 2019 Prasanna challa. All rights reserved.
//

import Foundation
import Cocoa
import CoreGraphics

struct RepeatingClicker {
    
    var location: NSPoint
    
    func startClicking() {
        Timer.scheduledTimer(withTimeInterval: 15, repeats: true) { (timer) in
            NSLog("timer fired")
            self.mouseClick()
        }
    }
    
    private func mouseClick() {
        NSLog("called mouseClick")
        let source = CGEventSource.init(stateID: .hidSystemState)
        let eventDown = CGEvent(mouseEventSource: source, mouseType: .leftMouseDown, mouseCursorPosition: location , mouseButton: .left)
        let eventUp = CGEvent(mouseEventSource: source, mouseType: .leftMouseUp, mouseCursorPosition: location , mouseButton: .left)
        
        
        eventDown?.post(tap: .cghidEventTap)
        
        usleep(500_000)
        eventUp?.post(tap: .cghidEventTap)
    }
}
