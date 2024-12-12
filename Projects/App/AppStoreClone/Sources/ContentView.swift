import SwiftUI
import Network

struct ContentView: View {
    
    @State private var selected: Tab = .today
    
    @available(iOS 16.0, *)
    var body: some View {
        ZStack {
            TabView(selection: $selected) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    NavigationStack {
                        tab.unitView
                    }.tag(tab)
                }
                .toolbar(.hidden, for: .tabBar)
            }
            
            VStack {
                Spacer()
                tabBar
            }
        }
    }
    
    var tabBar: some View {
        HStack {
            Spacer()
            
            ForEach(Tab.allCases, id: \.self) { tab in
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
