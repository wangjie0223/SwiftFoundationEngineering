//
//  Untitled.swift
//  ZhongYangQiXiang
//
//  Created by 王杰 on 2025/3/21.
//

/*
 •    在编写 SwiftUI 视图时，始终注意 body 属性只返回一个单一视图。
 •    在涉及多个子视图的情况下一律使用合适的容器来包裹它们。

这样记录下来后，可以有效避免将来因返回多个视图导致 Tab 重复显示的问题。
 */
import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack {
            ZStack(alignment: .top) {
                
                // 背景图
                Image(.homeBg)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                
                // 自定义导航条
                HomeNav()
                    .frame(width: UIScreen.main.bounds.width, height: 44)
                    .padding(.top, 44)   // 顶部内边距 20
                
            }
            // 如果希望直接顶到屏幕最上方（包括刘海 / 灵动岛），可以忽略顶部安全区
            .ignoresSafeArea(edges: .top)
            Spacer()
        }
        
        
    }
}
#Preview {
    HomeView()
}


struct HomeNav: View {
    var body: some View {
        ZStack {
            Color.clear
            HStack {
                Button(action: {
                    print("左侧按钮被点击")
                }) {
                    Image(.homeLogo)
                        //.resizable()
                        .aspectRatio(contentMode: .fit)
                        //.frame(width: 24, height: 24)
                        //.background(.red)
//                        // 给按钮一个固定区域，让图片居中
//                        .frame(width: 44, height: 44)
//                        .background(.yellow)
                }
                Spacer()
                Button(action: {
                    print("右侧按钮被点击")
                }) {
                    Image(.navMy)
                        //.resizable()
                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 24, height: 24)
//                        // 同样设置固定区域
//                        .frame(width: 44, height: 44)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}


#Preview {
    HomeNav()
}
