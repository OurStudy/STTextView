//  Created by Marcin Krzyzanowski
//  https://github.com/krzyzanowskim/STTextView/blob/main/LICENSE.md

import Cocoa

extension STTextView {

    @objc public func changeFont(_ sender: Any?) {
        guard isEditable, usesFontPanel, let fontManager = sender as? NSFontManager else {
            return
        }

        if let currentTypingFont = typingAttributes[.font] as? NSFont {
            let newFont = fontManager.convert(currentTypingFont)
            if !textLayoutManager.insertionPointLocations.isEmpty {
                typingAttributes[.font] = newFont

                undoManager?.registerUndo(withTarget: self) { textView in
                    textView.typingAttributes[.font] = currentTypingFont
                }
            } else {
                for textRange in textLayoutManager.textSelections.flatMap(\.textRanges) where !textRange.isEmpty {
                    addAttributes([.font: newFont], range: textRange)

                    undoManager?.registerUndo(withTarget: self) { textView in
                        textView.addAttributes([.font: currentTypingFont], range: textRange)
                    }
                }
            }
        }
    }
}
