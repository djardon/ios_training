//
//  SampleDataManager.swift
//  iOSClassCode
//
//  Created by David Jardon on 07/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import RealmSwift

class SampleDataManager {
    // MARK: - SINGLETON implementation -
    // Object unique instance
    static let shared = SampleDataManager()
    
    // Initializer access level change now
    private init(){}
    
    
    // MARK: - PROPERTIES  -
    private let mSubjectiOS = Subject(image: "DavidJardon",
                                      name: "Curso iOS",
                                      year: "2018 - 2019",
                                      comment: "Curso de desarrollo de aplicaciones para iOS utilizando Xcode y Swift")
    
    private let mSubjectAndroid = Subject(image: "DavidJardon",
                                          name: "Curso Android",
                                          year: "2018 - 2019",
                                          comment: "Curso de desarrollo de aplicaciones para Android utilizando Intellij y Kotlin")
    
    let mSampleMarks = [Mark(mark: Float(10.0)),
                        Mark(mark: Float(9.0)),
                        Mark(mark: Float(1.0)),
                        Mark(mark: Float(6.0)),
                        Mark(mark: Float(7.0)),
                        Mark(mark: Float(5.0)),
                        Mark(mark: Float(4.0)),
                        Mark(mark: Float(8.0)),
                        Mark(mark: Float(3.0)),
                        Mark(mark: Float(2.0))]
    
    
    // Get the default Realm
    private let realm = try! Realm()
    
    
    // MARK: - PUBLIC methods  -
    func initDefaultData() {
        try! realm.write {
            realm.deleteAll()
        }
        
        createStudents()
        createTeachers()
        createSubjects()
        createMarks()
    }
    
    func loadDefaultStudents() -> Results<Student> {
        return realm.objects(Student.self)
    }
    
    func loadDefaultSubjects() -> Results<Subject> {
        return realm.objects(Subject.self)
    }
    
    func loadDefaultTeachers() -> Results<Teacher> {
        return realm.objects(Teacher.self)
    }
    
    func loadDefaultMarks() -> Results<Mark> {
        return realm.objects(Mark.self).sorted(byKeyPath: "mark",
                                               ascending: false)
    }
    
    // MARK: - PRIVATE methods  -
    private func createSubjects() {
        // Write all subjects to database
        try! realm.write {
            realm.add(mSubjectiOS)
            realm.add(mSubjectAndroid)
        }
    }
    
    private func createMarks() {
        // Write all subjects to database
        try! realm.write {
            mSampleMarks.forEach { mark in
                realm.add(mark)
            }
        }
    }
    
    private func createTeachers() {
        // Write all subjects to database
        try! realm.write {
            realm.add(Teacher(photo: "DavidJardon",
                              name: "David",
                              surname: "Jardón",
                              year: "1985",
                              comment: "Profesor Android e iOS",
                              subjects: [mSubjectAndroid, mSubjectiOS]))
        }
    }
    
    private func createStudents() {
        let mSampleStudents = [Student(photo: "DavidJardon",
                                       name: "David",
                                       surname: "Jardón",
                                       year: "1985",
                                       comment: "Instructor",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectiOS]),
                               Student(photo: "Soko",
                                       name: "Soko",
                                       surname: "Weimar",
                                       year: "2015",
                                       comment: "Perro",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectiOS]),
                               Student(photo: "barney",
                                       name: "Barney",
                                       surname: "García",
                                       year: "1990",
                                       comment: "Muchas clases",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectiOS, mSubjectAndroid]),
                               Student(photo: "bart",
                                       name: "Bart",
                                       surname: "Simpson",
                                       year: "1988",
                                       comment: "El barto",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectAndroid]),
                               Student(photo: "marge",
                                       name: "Marge",
                                       surname: "Simpson",
                                       year: "2008",
                                       comment: "Marge mola",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectiOS, mSubjectAndroid]),
                               Student(photo: "homer",
                                       name: "Homer",
                                       surname: "Simpson",
                                       year: "2008",
                                       comment: "Homer pierde la cabeza",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectAndroid]),
                               Student(photo: "lisa",
                                       name: "Lisa",
                                       surname: "Simpson",
                                       year: "2008",
                                       comment: "Sabe de todo",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectiOS]),
                               Student(photo: "nelson",
                                       name: "Nelson",
                                       surname: "Nexus",
                                       year: "2008",
                                       comment: "JA JA",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectAndroid]),
                               Student(photo: "krusty",
                                       name: "Krusty",
                                       surname: "Rules",
                                       year: "2008",
                                       comment: "Krusty payaso",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectiOS, mSubjectAndroid]),
                               Student(photo: "milhouse",
                                       name: "Milhouse",
                                       surname: "Bad",
                                       year: "2002",
                                       comment: "Milhouse llora",
                                       mark: mSampleMarks.randomElement()!,
                                       subjects: [mSubjectAndroid])]
        
        // Write all students to database
        try! realm.write {
            mSampleStudents.forEach { student in
                realm.add(student)
            }
        }
    }
}
