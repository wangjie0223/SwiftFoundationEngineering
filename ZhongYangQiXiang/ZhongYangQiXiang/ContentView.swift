//
//  ContentView.swift
//  ZhongYangQiXiang
//
//  Created by 王杰 on 2025/3/20.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Tab.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        TabItemView(tab: tab, isSelected: selectedTab == tab)
                    }
                    .tag(tab)
            }
        }
    }
}

// MARK: - Tab 枚举，封装 title、icon 及对应视图
enum Tab: Int, CaseIterable {
    case home, weather, map, alerts, decision

    var title: String {
        switch self {
        case .home: return "首页"
        case .weather: return "天气"
        case .map: return "地图"
        case .alerts: return "预警"
        case .decision: return "决策"
        }
    }

    var imageName: (default: String, selected: String) {
        switch self {
        case .home: return ("tab_home_default", "tab_home_selected")
        case .weather: return ("tab_weather_default", "tab_weather_selected")
        case .map: return ("tab_map_default", "tab_map_selected")
        case .alerts: return ("tab_early_warning_default", "tab_early_warning_selected")
        case .decision: return ("tab_decision_making_default", "tab_decision_making_selected")
        }
    }

    var view: AnyView {
        switch self {
        case .home: return AnyView(HomeView())
        case .weather: return AnyView(WeatherView())
        case .map: return AnyView(MapView())
        case .alerts: return AnyView(AlertsView())
        case .decision: return AnyView(DecisionView())
        }
    }
}

// MARK: - 封装 TabItemView 组件
struct TabItemView: View {
    let tab: Tab
    let isSelected: Bool

    var body: some View {
        VStack {
            Image(isSelected ? tab.imageName.selected : tab.imageName.default)
            Text(tab.title)
        }
    }
}

// MARK: - 示例页面
struct HomeView: View { var body: some View { Text("首页") } }
struct WeatherView: View { var body: some View { Text("天气") } }
struct MapView: View { var body: some View { Text("地图") } }
struct AlertsView: View { var body: some View { Text("预警") } }
struct DecisionView: View { var body: some View { Text("决策") } }

#Preview {
    ContentView()
}
