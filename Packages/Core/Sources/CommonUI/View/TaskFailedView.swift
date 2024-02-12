//
//  TaskFailedView.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import SwiftUI

public struct TaskFailedView: View {
    public init() { }
    
    public var body: some View {
        Image(systemName: "xmark")
            .symbolRenderingMode(.multicolor)
            .imageScale(.large)
            .padding()
    }
}

struct TaskFailedView_Previews: PreviewProvider {
    static var previews: some View {
        TaskFailedView()
    }
}
