//
//  HelperFunction.swift
//  Dashboard People Counter
//
//  Created by ndyyy on 20/07/23.
//

import SwiftUI

class HelperFunction {
    static func toggleSideBar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}
