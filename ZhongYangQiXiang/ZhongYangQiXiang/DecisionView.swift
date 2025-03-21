//
//  Untitled.swift
//  ZhongYangQiXiang
//
//  Created by 王杰 on 2025/3/21.
//

import SwiftUICore
import SwiftUI

struct DecisionView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                
                let a = JSON(viewModel.responseData)
                
                
                Text("\(a)")
                    .padding()
                    .font(.system(.body, design: .monospaced))
            }
        }
        .onAppear {
            viewModel.fetchVideos()
        }
        .navigationTitle("决策")
    }
}
