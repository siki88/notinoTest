//
//  ProductListCollectionCell.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 04/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import SwiftUI

struct ProductListCollectionCell: View {
    
    @ObservedObject var viewModel: ProductListCollectionVM = ProductListCollectionVM(product: ProductListModel())
    @State var selection: Int? = nil
    
    var body: some View {
        return VStack(alignment: .center, spacing: 0.0) {
            HStack(alignment: .center, spacing: 0.0) {
                ZStack(alignment: .top) {
                    
                    VStack(alignment: .trailing, spacing: 0.0) {
                        HStack(alignment: .top, spacing: 0.0) {
                            Spacer()
                            likeGradientView(self.viewModel.product.like ?? false)
                        }
                        Spacer()
                    }
                    
                    VStack(alignment: .center, spacing: 8) {
                        AsyncImage(
                            url: self.viewModel.getUrl(self.viewModel.product.imageUrl)!,
                            placeholder: Text("")
                        )
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150.0, height: 150.0)
                        
                        Text(self.viewModel.product.brand?.name ?? "")
                            .modifier(TextModifier(lineLimit: 1))
                        
                        Text(self.viewModel.product.name ?? "")
                            .fontWeight(.bold)
                            .modifier(TextModifier(lineLimit: 1))
                        
                        Text(self.viewModel.product.annotation ?? "")
                            .modifier(TextModifier(lineLimit: 2))
                        
                        self.starsGradientView(self.viewModel.product.reviewSummary?.score ?? 0)
                        
                        Text("\(self.viewModel.product.price?.value ?? 0) \(self.viewModel.getCurrency(self.viewModel.product.price?.currency))")
                        
                        openProductDetail(self.viewModel.product)
                    }
                }
            }
        }
        .padding(.vertical, 16)
        .buttonStyle(PlainButtonStyle())
    }
    
    private func starsGradientView(_ reviewSummary: Int) -> some View {
        return HStack(alignment: .center, spacing: 0) {
            ForEach(0..<5) { row in
                Image(self.viewModel.calculateStars(row: row, reviewSummary: reviewSummary)).resizable()
                    .frame(width: 16.0, height: 16.0)
            }
        }
    }
    
    private func likeGradientView(_ like: Bool) -> some View {
        return Button(action: {
            self.viewModel.setLikeGradientImage(like)
        }) {
            Image(self.viewModel.likeGradientImage(like))
                .renderingMode(.original)
                .resizable()
                .frame(width: 30.0, height: 30.0)
                .aspectRatio(contentMode: .fit)
        }
    }
    
    private func openProductDetail(_ product: ProductListModel) -> some View {
        return Button(action: {
            self.selection = 1
        }) {
            Text("DO KOŠÍKU")
                .padding(10.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 0.0)
                        .stroke(lineWidth: 1.0)
            )
        }
    }
}

struct TextModifier: ViewModifier {
    var lineLimit: Int
    
    func body(content: Content) -> some View { content
        .lineLimit(lineLimit)
        .multilineTextAlignment(.center)
    }
}

struct ProductListCollectionCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductListCollectionCell(viewModel: ProductListCollectionVM(product: ProductListModel(id: "1",
                                                                                               productId: 1,
                                                                                               masterId: 1,
                                                                                               price: nil,
                                                                                               name: "Product name",
                                                                                               brand: nil,
                                                                                               annotation: nil,
                                                                                               orderUnit: nil,
                                                                                               attributes: nil,
                                                                                               imageUrl: nil,
                                                                                               stockAvailability: nil,
                                                                                               reviewSummary: nil)))
    }
}
