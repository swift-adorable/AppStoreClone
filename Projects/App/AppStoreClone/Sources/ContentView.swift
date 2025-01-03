import SwiftUI
import Today

import Common

struct ContentView: View {
    
    @State private var selected: Tab = .today
    @State private var tabCases: [Tab] = Tab.allCases
    
    @StateObject var globalAppState = GlobalAppState()
    
    @State private var isHiddenTabBar: Bool = false
    
    @Namespace var animation
    
    @available(iOS 16.0, *)
    var body: some View {
        ZStack {
            
            TabView(selection: $selected) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    NavigationStack {
                        tab.unitView(animation)
                            .environmentObject(globalAppState)
                    }.tag(tab)
                }
                .toolbar(.hidden, for: .tabBar)
            }
            .navigationBarTitleDisplayMode(.inline)
            
            if isHiddenTabBar == false {
                VStack {
                    Spacer()
                    tabBar
                }
            }
            
            
        }.onReceive(globalAppState.todayState.$isDetailViewShowing) { isDetailViewShowing in
            isHiddenTabBar = isDetailViewShowing
        }
    }
    
    var tabBar: some View {
        HStack {
            Spacer()
            
            ForEach(tabCases, id: \.self) { tab in
                Button {
                    selected = tab
                } label: {
                    VStack(alignment: .center) {
                        Image(systemName: tab.imageSystemName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22)
                        if selected == tab {
                            Text(tab.rawValue)
                                .font(.system(size: 11))
                        }
                    }
                }
                .foregroundStyle(selected == tab ? Color.mint : Color.primary)
                Spacer()
            }
            
        }
        .padding()
        .frame(height: 72)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.15), radius: 8, y: 2)
        }
        .padding(.horizontal)
        .offset(y: 18)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
