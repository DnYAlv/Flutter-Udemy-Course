class ItemModel {
  late final int? id;
  late final bool? deleted;
  late final String? type;
  late final int? time;
  late final String? text;
  late final bool? dead;
  late final int? parent;
  late final List<dynamic>? kids;
  late final String? url;
  late final int? score;
  late final String? title;
  late final int? descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      deleted = parsedJson['deleted'],
      type = parsedJson['type'],
      time = parsedJson['time'],
      text = parsedJson['text'],
      dead = parsedJson['dead'],
      parent = parsedJson['parent'],
      kids = parsedJson['kids'],
      url = parsedJson['url'],
      score = parsedJson['score'],
      title = parsedJson['title'],
      descendants = parsedJson['descendants'];
}