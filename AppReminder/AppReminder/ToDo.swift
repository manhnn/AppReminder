//
//  ToDo.swift
//  AppReminder
//
//  Created by Nguyen Manh on 30/12/2020.
//

import Foundation
import UIKit

class Reminder{
    public var work: String
    public var time: String
    public var isSuccess: Bool
    public var image: String
    
    init(work: String, time: String, isSuccess: Bool, image: String) {
        self.work = work
        self.time = time
        self.isSuccess = isSuccess
        self.image = image
    }
}
