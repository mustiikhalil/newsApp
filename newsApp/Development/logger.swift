//
//  logger.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/4/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation
import SwiftyBeaver

struct Logger {
    
    let logger = SwiftyBeaver.self
    let console = ConsoleDestination()  // logger to Xcode Console
    let file = FileDestination()  // logger to default swiftybeaver.logger file
    let cloud = SBPlatformDestination(appID: appID, appSecret: appSecret, encryptionKey: encryptionKey) // to cloud
    
    init() {
        console.format = "$DHH:mm:ss$d $L $M"
        logger.addDestination(console)
        logger.addDestination(file)
        logger.addDestination(cloud)
    }
}
