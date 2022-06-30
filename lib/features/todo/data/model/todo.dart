
class Todo {
  int? id;
  late String title;
  late String content;
  late DateTime createdOn;
  late bool isFinished;

  Todo({
    this.id, 
    required this.title, 
    required this.content, 
    required this.createdOn, 
    required this.isFinished
  });

  Todo.toTodoObject(Map<String, dynamic> item) {
    id = item['id'];
    title = item['title'];
    content = item['content'];
    createdOn = DateTime.parse(item['createdOn']);
    isFinished = (item['isFinished'] == 1);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['createdOn'] = createdOn.toIso8601String();
    data['isFinished'] = isFinished ? 1 : 0;
    return data;
  }
}
