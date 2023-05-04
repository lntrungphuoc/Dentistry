class News {
  News({
    required this.id,
    required this.title,
    required this.content,
    required this.url,
    required this.thumbnail,
    required this.forMobile,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    this.modifiedBy,
  });
  late final int id;
  late final String title;
  late final String content;
  late final String url;
  late final String thumbnail;
  late final bool forMobile;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    url = json['url'];
    thumbnail = json['thumbnail'];
    forMobile = json['forMobile'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['url'] = url;
    _data['thumbnail'] = thumbnail;
    _data['forMobile'] = forMobile;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    return _data;
  }
}
