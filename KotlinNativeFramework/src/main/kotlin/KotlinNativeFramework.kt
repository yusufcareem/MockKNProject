//
//  KotlinNativeFramework.kt
//  KotlinNativeFramework
//
//  Created by Yusuf Afghan on 7/11/18.
//  Copyright © 2018 mock. All rights reserved.
//

class KotlinNativeFramework(val networkCallWithSuspend: NetworkCallWithSuspend, val networkCalls: NetworkCalls, val state: State) {
    suspend fun doSomethingSuspend() {
        state.id = networkCallWithSuspend.performNetworkCall("url")
    }

    fun doSomething() {
        networkCalls.performNetworkCall(url = "url", completionHandler = { result, error ->
            state.id = result!!
        })
    }
}

//implemented on iOS Side
interface State {

    var id: Int
}

//will be implemented on iOS Side
interface NetworkCalls {

    fun performNetworkCall(url: String, completionHandler: (Int?, Error?) -> Unit)
}

//will be implemented on iOS Side
interface NetworkCallWithSuspend {

    suspend fun performNetworkCall(url: String): Int
}