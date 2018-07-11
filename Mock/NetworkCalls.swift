//
//  ViewController.swift
//  Mock
//
//  Created by Yusuf Afghan on 7/11/18.
//  Copyright © 2018 mock. All rights reserved.
//

import UIKit
import KotlinNativeFramework

class EntryPoint {
    
    func enter() {
        
        KNFKotlinNativeFramework(networkCallWithSuspend: NetworkSuspend(), networkCalls: Network(), state: State(id: Int32(1)))
    }
}

class Network: KNFNetworkCalls {

    func performNetworkCall(url: String, completionHandler: @escaping (NSNumber?, KNFStdlibError?) -> KNFStdlibUnit) {
        
        let url = URL(string: url)!
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: url) { (data, response, error) in
            _ = completionHandler(1, nil)
        }
    }
}

class NetworkSuspend: KNFNetworkCallWithSuspend {
    
    //nothing to implement!
}

//state of the app
class State: KNFState {
    
    var id: Int32
    
    init(id: Int32) {
        self.id = id
    }
}
