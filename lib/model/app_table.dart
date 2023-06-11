class app_table {
  final int? id;
  final String user_id;
  final String app_name;
  final String app_icon;
  final String app_packagename;

  app_table(
      {this.id,
      required this.user_id,
      required this.app_name,
      required this.app_icon,
      required this.app_packagename});

  factory app_table.fromJson(Map<String, dynamic> json) {
    return app_table(
      id: json['id'],
      user_id: json['user_id'],
      app_name: json['app_name'],
      app_icon: json['app_icon'],
      app_packagename: json['app_packagename'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'user_id': user_id,
      'app_name': app_name,
      'app_icon': app_icon,
      'app_packagename': app_packagename,
    };
  }
}
