import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<ItemModel?>>>();
  final _itemsFetcher = PublishSubject<int>();

  // Getters to streams
  Stream<List<int>> get topIds => _topIds.stream;
  Stream<Map<int, Future<ItemModel?>>> get items => _itemsOutput.stream;

  // Getters to Sinks
  Function(int) get fetchItem => _itemsFetcher.sink.add;

  StoriesBloc() {
    _itemsFetcher.stream
      .transform(_itemsTransformers())
      .pipe(_itemsOutput);
  }

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids ?? []);
  }

  ScanStreamTransformer<int, Map<int, Future<ItemModel?>>> _itemsTransformers() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel?>> cache, int id, int index) {
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel?>>{},
    );
  }

  clearCache() {
    return _repository.clearCache();
  }

  void dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}