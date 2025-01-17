//
//  KeyProvider.swift
//  Inner-garden-ios
//
//  Created by John Wising on 2025/1/16.
//

import AVFoundation

class KeyProvider: NSObject, AVAssetResourceLoaderDelegate {
    /// Key for decrypt streaming file
    private var key: Data?
    
    /// Set key value
    func setKey(key: Data?) {
        self.key = key
    }
    
    func resourceLoader(_ resourceLoader: AVAssetResourceLoader,
                       shouldWaitForLoadingOfRequestedResource loadingRequest: AVAssetResourceLoadingRequest) -> Bool {
                       
        guard loadingRequest.request.url?.scheme == "https", let key else {
            return false
        }
        
        loadingRequest.dataRequest?.respond(with: key)
        loadingRequest.finishLoading()
        
        return true
    }
}
