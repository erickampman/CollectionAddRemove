//
//  ItemView.swift
//  CollectionAddRemove
//
//  Created by Eric Kampman on 10/9/24.
//

import SwiftUI

struct ItemView: View {
	@Bindable var item: Item
	
    var body: some View {
		Text(item.id)
//			.padding()
    }
}

#Preview {
	@Previewable @State var item: Item = Item(title: "Foobar", instance: 1)
	ItemView(item: item)
}
