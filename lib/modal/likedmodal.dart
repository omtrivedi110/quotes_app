class LikeModal {
  final int Id;
  final String FaQuotes;
  final String FaAuthor;
  final String FaCategory;

  LikeModal(this.Id, this.FaQuotes, this.FaAuthor, this.FaCategory);

  factory LikeModal.fromMap({required Map data}) {
    return LikeModal(
        data['Id'], data['FaQuotes'], data['FaAuthor'], data['FaCategory']);
  }
}
