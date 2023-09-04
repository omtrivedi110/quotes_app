class LikeModal {
  final int qtLId;
  final String qtLQuotes;
  final String qtLCategory;
  final String qtLauthor;

  LikeModal(this.qtLId, this.qtLQuotes, this.qtLCategory, this.qtLauthor);

  factory LikeModal.fromMap({required Map data}) {
    return LikeModal(data['qtLId'], data['qtLQuotes'], data['qtLCategory'],
        data['qtLauthor']);
  }
}
