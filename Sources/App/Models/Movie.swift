import Fluent
import Vapor

final class Movie: Model, Content {
    static let schema = "movies"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Field(key: "poster")
    var poster: String
    
    @Children(for: \.$movie)
    var reviews: [Review]

    init() { }

    init(id: UUID? = nil, title: String, poster: String) {
        self.id = id
        self.title = title
        self.poster = poster
    }
}
