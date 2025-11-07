abstract class ApiConstants{
  static const String baseUrl = 'http://localhost:3000';
  static const String registerEndPoint = 'auth/register';
  static const String loginEndPoint = 'auth/login';
  static const String forgotPasswordEndPoint = 'auth/forgot';
  static const String verifyOtpEndPoint = 'auth/verify_otp';
  static const String resetPasswordEndPoint = 'auth/resete';
  static const String categoryEndPoint = 'categories/';
  static const String storiesEndPoint = 'stories/';
  static const String libraryEndPoint = 'library/';
  static const String storiesByCategoryEndPoint = 'stories/category/';
  static const String getStoryEndPoint = 'stories';

  /// Admin Endpoints
  static const String loginAdminEndPoint = '/admin/auth/login';
  static const String registerAdminEndPoint = '/admin/auth/register';
  static const String adminStatsDashboardEndPoint = '/admin/stats/dashboard';
  static const String adminCategoriesEndPoint = '/admin/categories/';
  static const String adminStoriesEndPoint = '/admin/stories/';
  static const String categoriesNamesEndPoint = '/admin/categories/names/list';

  static const String tokenKey = 'token';
  static const String adminAccessToken = 'accessToken';
  static const String adminRefreshToken = 'refreshToken';
}