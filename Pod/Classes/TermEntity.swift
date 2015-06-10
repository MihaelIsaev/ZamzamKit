//
//  TermEntity.swift
//
//  This code was generated by AlecrimCoreData code generator tool.
//
//  Changes to this file may cause incorrect behavior and will be lost if
//  the code is regenerated.
//

import Foundation
import CoreData
import SwiftyJSON
import Timepiece

import AlecrimCoreData

public class TermEntity: NSManagedObject {

    @NSManaged public var content: String?
    @NSManaged public var count: Int32 // cannot mark as optional because Objective-C compatibility issues
    @NSManaged public var id: Int32 // cannot mark as optional because Objective-C compatibility issues
    @NSManaged public var slug: String?
    @NSManaged public var taxonomy: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

    @NSManaged public var parent: TermEntity?

    @NSManaged public var posts: Set<BlogPostEntity>

}

// MARK: - AlecrimCoreData query attributes

extension TermEntity {

    public static let content = AlecrimCoreData.Attribute<String?>("content")
    public static let count = AlecrimCoreData.Attribute<Int32?>("count")
    public static let id = AlecrimCoreData.Attribute<Int32?>("id")
    public static let slug = AlecrimCoreData.Attribute<String?>("slug")
    public static let taxonomy = AlecrimCoreData.Attribute<String?>("taxonomy")
    public static let title = AlecrimCoreData.Attribute<String?>("title")
    public static let url = AlecrimCoreData.Attribute<String?>("url")

    public static let parent = TermEntityAttribute<TermEntity?>("parent")

    public static let posts = AlecrimCoreData.EntitySetAttribute<Set<BlogPostEntity>>("posts")

}

public class TermEntityAttribute<T>: AlecrimCoreData.SingleEntityAttribute<T> {

    public override init(_ name: String) { super.init(name) }

    public lazy var content: AlecrimCoreData.Attribute<String?> = { AlecrimCoreData.Attribute<String?>("\(self.___name).content") }()
    public lazy var count: AlecrimCoreData.Attribute<Int32?> = { AlecrimCoreData.Attribute<Int32?>("\(self.___name).count") }()
    public lazy var id: AlecrimCoreData.Attribute<Int32?> = { AlecrimCoreData.Attribute<Int32?>("\(self.___name).id") }()
    public lazy var slug: AlecrimCoreData.Attribute<String?> = { AlecrimCoreData.Attribute<String?>("\(self.___name).slug") }()
    public lazy var taxonomy: AlecrimCoreData.Attribute<String?> = { AlecrimCoreData.Attribute<String?>("\(self.___name).taxonomy") }()
    public lazy var title: AlecrimCoreData.Attribute<String?> = { AlecrimCoreData.Attribute<String?>("\(self.___name).title") }()
    public lazy var url: AlecrimCoreData.Attribute<String?> = { AlecrimCoreData.Attribute<String?>("\(self.___name).url") }()

    public lazy var parent: TermEntityAttribute<TermEntity?> = { TermEntityAttribute<TermEntity?>("\(self.___name).parent") }()

    public lazy var posts: AlecrimCoreData.EntitySetAttribute<Set<BlogPostEntity>> = { AlecrimCoreData.EntitySetAttribute<Set<BlogPostEntity>>("\(self.___name).posts") }()

}

extension TermEntity {
    
    public static func fromJSON(json: JSON) -> TermEntity? {
        if json.type != .Null {
            var entity = ZamzamManager.sharedInstance.dataContext.terms.firstOrCreated { $0.id == json["ID"].int32 }
            entity.title = json["name"].string
            entity.content = json["description"].string
            entity.url = json["link"].string
            entity.slug = json["slug"].string
            entity.taxonomy = json["taxonomy"].string
            
            if let count = json["count"].int32 {
                entity.count = count
            }
            
            if json["parent"].type != .Null {
                entity.parent = ZamzamManager.sharedInstance.dataContext.terms.firstOrCreated {
                    $0.id == json["parent"]["ID"].int32!
                }
            }
            
            return entity
        }
        
        return nil
    }
    
}
