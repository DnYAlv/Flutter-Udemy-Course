import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../models/item_model.dart';
import 'loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel?>> itemMap;
  final int depth;

  const Comment({super.key, required this.itemId, required this.itemMap, required this.depth});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot<ItemModel?> snapshot) {
        if (!snapshot.hasData) {
          return const LoadingContainer();
        }
        
        final item = snapshot.data!;
        var commentList = [];

        for (var kidId in item.kids!) {
          commentList.add(Comment(
            itemId: kidId,
            itemMap: itemMap,
            depth: depth + 1,
          ),);
        }

        return Column(
          children: [
            ListTile(
              title: buildText(item),
              subtitle: item.by == "" ? const Text("Deleted") : Text(item.by!),
              contentPadding: EdgeInsets.only(
                right: 16.0,
                left: depth * 16.0,
              ),
            ),
            const Divider(),
            ...commentList,
          ],
        );
      }
    );
  }

  Widget buildText(ItemModel item) {
    return HtmlWidget(
      item.text!,
    );
  }
}