import SwiftUI

import Common
import Model

struct TodayView: View {
    
    @State private var apps = [Model.App]()
    
    var body: some View {
        
        ScrollView([.vertical, .horizontal], showsIndicators: false) {
            Spacer(minLength: 10)
            VStack {
                ForEach(apps, id: \.self) { app in
                    HStack(spacing: 20) {
                        Text(app.appName)
                        Spacer()
                        Text(app.primaryGenre)
                    }
                }
            }
            Spacer(minLength: 10)
        }
        .padding(.top, 1)
        .padding(.bottom, 52)
        .onAppear {
            apps = Bundle.main.decode(Model.Apps.self, from: "AppStore DummyData.json")
        }        
        
    }
    
}
