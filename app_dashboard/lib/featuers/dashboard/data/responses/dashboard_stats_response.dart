class StatisticsResponse {
  final UserStatsResponse userStatsResponse;
  final ContentStatsResponse contentStatsResponse;

  StatisticsResponse({
    required this.userStatsResponse,
    required this.contentStatsResponse,
  });

  factory StatisticsResponse.fromJson(Map<String, dynamic> json) =>
      StatisticsResponse(
        userStatsResponse: UserStatsResponse.fromJson(json['statistics']['users']),
        contentStatsResponse: ContentStatsResponse.fromJson(json['statistics']['content']),
      );
}

class UserStatsResponse {
  final int total;
  final int totalAdmins;
  final int totalParents;
  final int totalChildren;
  final int totalRecentRegistrations;

  UserStatsResponse({
    required this.total,
    required this.totalAdmins,
    required this.totalParents,
    required this.totalChildren,
    required this.totalRecentRegistrations,
  });

  factory UserStatsResponse.fromJson(Map<String, dynamic> json) =>
      UserStatsResponse(
        total: json['total'],
        totalAdmins: json['admins'],
        totalParents: json['parents'],
        totalChildren: json['children'],
        totalRecentRegistrations: json['recentRegistrations'],
      );
}

class ContentStatsResponse {
  final int totalCategories;
  final int totalStories;
  final int activeStories;
  final int inactiveStories;

  ContentStatsResponse({
    required this.totalCategories,
    required this.totalStories,
    required this.activeStories,
    required this.inactiveStories,
  });

  factory ContentStatsResponse.fromJson(Map<String, dynamic> json) =>
      ContentStatsResponse(
        totalCategories: json['totalCategories'],
        totalStories: json['totalStories'],
        activeStories: json['activeStories'],
        inactiveStories: json['inactiveStories'],
      );
}
