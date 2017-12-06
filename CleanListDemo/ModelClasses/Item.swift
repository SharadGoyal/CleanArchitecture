//
//  Item.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import JSONParserSwift

final class Item: ParsableModel {
    
    var buyItNowPrice: BuyItNowPrice?
    var country: String?
    var globalId: String?
    var imageURL: String?
    var itemId: String?
    var primaryCategoryId: String?
    var primaryCategoryName: String?
    var shippingCost: BuyItNowPrice?
    var shippingType: String?
    var subtitle: String?
    var timeLeft: String?
    var title: String?
    var viewItemURL: String?
    var watchCount: String?
}

final class BuyItNowPrice: ParsableModel {
    
    var currencyId: String?
    var value: String?
}

final class GetMostWatchedItemsResponse: ParsableModel {
    
    var ack: String?
    var itemRecommendations: ItemRecommendation?
    var timestamp: String?
    var version: String?
}

final class ItemRecommendation: ParsableModel {
    
    var item: [Item]?
}

final class MostWatchedItems: ParsableModel {
    
    var getMostWatchedItemsResponse: GetMostWatchedItemsResponse?
}
