//
//  RandomModel.swift
//  RocketChat
//
//  Created by Bibin Jacob Pulickal on 29/08/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .short
    return dateFormatter
}

func randomTime() -> Date {
    
    let randomTimeInterwal = Int.random(in: 1..<89600)
    return Date().addingTimeInterval(TimeInterval(randomTimeInterwal))
}

var randomUserViewModel: UserViewModel {
    
    let randomFirstName = ["Ford", "Zaphod", "Trillian", "Arthur", "Marvin", "Derick", "Shelley"].randomElement() ?? ""
    let randomLastName = ["Terrell", "Pearson", "Hester", "Gonzales", "George", "Shaw", "Martinez"].randomElement() ?? ""
    
    return UserViewModel(
        name: randomFirstName + " " + randomLastName,
        lastMessage: messages.randomElement(),
        profileImageUrl: "https://picsum.photos/200/?random",
        newMessageCount: "\(Int.random(in: 1..<99))",
        lastMessageTime: dateFormatter.string(from: randomTime()))
}

var messages = ["Oy", "Hi, Ssup?", "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                "Contrary to popular belief, Lorem Ipsum is not simply random text.",
                "It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                "Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source",
                "Lorem Ipsum comes from sections 1.10.32 and 1.10.33",
                "de Finibus Bonorum et Malorum",
                "(The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum",
                "Lorem ipsum dolor sit amet..",
                "comes from a line in section 1.10.32", "Bye"]


