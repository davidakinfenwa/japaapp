

class NewsSectionModel {
    final NewsListModel news;

    NewsSectionModel({
        required this.news,
    });

    factory NewsSectionModel.fromJson(Map<String, dynamic> json) => NewsSectionModel(
        news: NewsListModel.fromJson(json["news"]),
    );

    Map<String, dynamic> toJson() => {
        "news": news.toJson(),
    };
    factory NewsSectionModel.empty(){
      return NewsSectionModel(news: NewsListModel.empty());
    }
}

class NewsListModel {
    final int currentPage;
    final List<NewsModel> newsData;
    final String firstPageUrl;
    final int from;
    final int lastPage;
    final String lastPageUrl;
   // final List<Link> links;
    final String nextPageUrl;
    final String path;
    final int perPage;
    final dynamic prevPageUrl;
    final int to;
    final int total;

    NewsListModel({
        required this.currentPage,
        required this.newsData,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
      //  required this.links,
        required this.nextPageUrl,
        required this.path,
        required this.perPage,
        required this.prevPageUrl,
        required this.to,
        required this.total,
    });

    factory NewsListModel.fromJson(Map<String, dynamic> json) => NewsListModel(
        currentPage: json["current_page"],
        newsData: List<NewsModel>.from(json["data"].map((x) => NewsModel.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
      //  links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(newsData.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
       // "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
    factory NewsListModel.empty(){
      return NewsListModel(currentPage: 0, newsData: [], firstPageUrl: "", from: 0, lastPage: 0, lastPageUrl: "", nextPageUrl: "", path: "", perPage: 0, prevPageUrl: "", to: 0, total: 0);
    }
}

class NewsModel {
    final int id;
    final String media;
    final String mediaType;
    final String headLine;
    final String title;
    final String body;
    final String postedBy;
    final DateTime date;
    final String time;
    final String status;
    final String mediaImageUrl;
    final DateTime createdAt;
    final DateTime updatedAt;

    NewsModel({
        required this.id,
        required this.media,
        required this.mediaType,
        required this.headLine,
        required this.title,
        required this.body,
        required this.postedBy,
        required this.date,
        required this.time,
        required this.status,
        required this.mediaImageUrl,
        required this.createdAt,
        required this.updatedAt,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        media: json["media"],
        mediaType: json["media_type"],
        headLine: json["head_line"],
        title: json["title"],
        body: json["body"],
        postedBy: json["posted_by"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
        mediaImageUrl: json["media_image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "media": media,
        "media_type": mediaType,
        "head_line": headLine,
        "title": title,
        "body": body,
        "posted_by": postedBy,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
        "media_image_url": mediaImageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };

    factory NewsModel.empty(){
      return NewsModel(id: 0, media: "", mediaType: "", headLine: "", title: "", body: "", postedBy: "", date: DateTime.now(), time: "", status: "", mediaImageUrl: "", createdAt: DateTime.now(), updatedAt: DateTime.now());
    }
}


// /// The `Link` class in Dart represents a link with properties for URL, label, and active status,
/// along with methods for JSON serialization.
//class Link {
//     final String url;
//     final String label;
//     final bool active;

//     Link({
//         required this.url,
//         required this.label,
//         required this.active,
//     });

//     factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"],
//         label: json["label"],
//         active: json["active"],
//     );

//     Map<String, dynamic> toJson() => {
//         "url": url,
//         "label": label,
//         "active": active,
//     };
// }


class RecentNewsModel {
    final List<NewsModel> news;

    RecentNewsModel({
        required this.news,
    });

    factory RecentNewsModel.fromJson(Map<String, dynamic> json) => RecentNewsModel(
        news: List<NewsModel>.from(json["news"].map((x) => NewsModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
    };

    factory RecentNewsModel.empty(){
      return RecentNewsModel(news: []);
    }
}