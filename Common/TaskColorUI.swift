/*
//  Tasks
//
//  Created by Henry W. Lu on 5/17/15.
    
    Abstract:
    An extension on the `Task.Color` enumeration that adds a computed property to obtain a platform-specific color object from the enumeration value.
*/

#if os(iOS)
import UIKit
#elseif os(OSX)
import Cocoa
#endif

// Provide a private typealias for a platform specific color.
#if os(iOS)
private typealias AppColor = UIColor
#elseif os(OSX)
private typealias AppColor = NSColor
#endif

public extension Task.Color {
    private static let colorMapping = [
        Task.Color.Gray:   AppColor.darkGrayColor(),
        Task.Color.Blue:   AppColor(red: 0.42, green: 0.70, blue: 0.88, alpha: 1),
        Task.Color.Green:  AppColor(red: 0.71, green: 0.84, blue: 0.31, alpha: 1),
        Task.Color.Yellow: AppColor(red: 0.95, green: 0.88, blue: 0.15, alpha: 1),
        Task.Color.Orange: AppColor(red: 0.96, green: 0.63, blue: 0.20, alpha: 1),
        Task.Color.Red:    AppColor(red: 0.96, green: 0.42, blue: 0.42, alpha: 1)
    ]

    #if os(iOS)
    public var colorValue: UIColor {
        return Task.Color.colorMapping[self]!
    }
    #elseif os(OSX)
    public var colorValue: NSColor {
        return Task.Color.colorMapping[self]!
    }
    #endif
}
