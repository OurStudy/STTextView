//  Created by Marcin Krzyzanowski
//  https://github.com/krzyzanowskim/STTextView/blob/main/LICENSE.md

import SwiftUI
import STTextViewUI

struct ContentView: View {
    @State private var text = try! String(contentsOf: Bundle.main.url(forResource: "content", withExtension: "txt")!)

    var body: some View {
        TextView(
            text: $text,
            font: NSFont.monospacedSystemFont(ofSize: NSFont.systemFontSize, weight: .regular),
            options: [.wrapLines, .highlightSelectedLine]
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
