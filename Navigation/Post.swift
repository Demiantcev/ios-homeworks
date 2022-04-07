//
//  Post.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 17.02.2022.
//

import UIKit

struct Post {
    var title = String()
}

struct PostProfile {
    var author = String()
    var description = String()
    var image = String()
    var likes = Int()
    var views = Int()
}
var postProfile: [PostProfile] = [
    .init(author: "No name", description: "Вконтакте представила функцию по переносу фото и видео из Instagram. С сегодняшнего дня Instagram в России недоступен. О блокировке Роскомнадзор предупредил за два дня и дал время на загрузку всех фото, видео и данных.", image: "vkNews", likes: 500, views: 1500),
    .init(author: "Костя Баранов", description: "Apple выпустила iOS 15.4 с новыми эмодзи и разблокировкой айфона в маске.", image: "ios", likes: 208, views: 500),
    .init(author: "Wylsacom", description: "Как просто покупать приложения и оплачивать подписки в App Store и Google Play в России. В App Store больше нельзя воспользоваться российскими картами. Связано это с тем, что Visa и Mastercard ушли из РФ, а перед этим отключили SWIFT. Оплата просто не будет проходить.", image: "appStor", likes: 407, views: 1200),
    .init(author: "apple.news", description: "Базовый Mac Studio с Apple M1 Max стоит $1999, а если покупать с M1 Ultra, то придётся удвоить бюджет.", image: "macStudio", likes: 1230, views: 1500)
]


