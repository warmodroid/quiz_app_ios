//
//  Quiz+CoreDataProperties.swift
//  Trivia App
//
//  Created by Mohit Agrawal on 04/09/20.
//  Copyright © 2020 Mohit Agrawal. All rights reserved.
//
//

import Foundation
import CoreData


extension Quiz {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quiz> {
        return NSFetchRequest<Quiz>(entityName: "QuizCoreData")
    }

    @NSManaged public var answerOne: String?
    @NSManaged public var answerTwo: String?
    @NSManaged public var playername: String?
    @NSManaged public var questionOne: String?
    @NSManaged public var questionTwo: String?

}
