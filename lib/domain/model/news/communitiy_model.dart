

import 'package:japaapp/domain/model/models.dart';

class RecentCommunitiesModel {
    final List<Community> communities;

    RecentCommunitiesModel({
        required this.communities,
    });

    factory RecentCommunitiesModel.fromJson(Map<String, dynamic> json) => RecentCommunitiesModel(
        communities: List<Community>.from(json["communities"].map((x) => Community.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "communities": List<dynamic>.from(communities.map((x) => x.toJson())),
    };

    factory RecentCommunitiesModel.empty(){
      return RecentCommunitiesModel(communities: []);
    }
}

class Community {
    final   String id;
    final String communityName;
    final String description;
    final dynamic logo;
    final String totalMembers;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;

    Community({
        required this.id,
        required this.communityName,
        required this.description,
        required this.logo,
        required this.totalMembers,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"].toString(),
        communityName: json["community_name"]!=null? json["community_name"]:"",
        description:json["description"]!=null? json["description"]:"",
        logo: json["logo"]!=null? json["logo"]:"",
        totalMembers: json["total_members"]!=null? json["total_members"]:"",
        status: json["status"]!=null? json["status"]:"",
        createdAt: json["created_at"]!=null?DateTime.parse(json["created_at"]):DateTime.now(),
        updatedAt: json["updated_at"]!=null?DateTime.parse(json["updated_at"]):DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "community_name": communityName,
        "description": description,
        "logo": logo,
        "total_members": totalMembers,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}



class AllCommunitiesModel {
    final Communities communities;

    AllCommunitiesModel({
        required this.communities,
    });

    factory AllCommunitiesModel.fromJson(Map<String, dynamic> json) => AllCommunitiesModel(
        communities: Communities.fromJson(json["communities"]),
    );

    Map<String, dynamic> toJson() => {
        "communities": communities.toJson(),
    };
    

    factory AllCommunitiesModel.empty(){
      return AllCommunitiesModel(communities: Communities.empty());
    }
}

class Communities {
    final int currentPage;
    final List<Community> communities;
    final String firstPageUrl;
    final int from;
    final int lastPage;
    final String lastPageUrl;
    
    final dynamic nextPageUrl;
    final String path;
    final int perPage;
    final dynamic prevPageUrl;
    final int to;
    final int total;

    Communities({
        required this.currentPage,
        required this.communities,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
       
        required this.nextPageUrl,
        required this.path,
        required this.perPage,
        required this.prevPageUrl,
        required this.to,
        required this.total,
    });

    factory Communities.fromJson(Map<String, dynamic> json) => Communities(
        currentPage: json["current_page"],
        communities: List<Community>.from(json["data"].map((x) => Community.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(communities.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };

    factory Communities.empty(){
      return Communities(currentPage: 0, communities: [], firstPageUrl: "", from: 0, lastPage: 0, lastPageUrl: "", nextPageUrl: "", path: "", perPage: 0, prevPageUrl: "", to: 0, total: 0);
    }
}

