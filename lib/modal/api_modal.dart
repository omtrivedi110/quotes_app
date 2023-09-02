class ApiModal {
  final String quote;
  final String author;
  final String category;

  ApiModal(
    this.quote,
    this.author,
    this.category,
  );

  factory ApiModal.fromApi({required Map data}) {
    return ApiModal(
      data['quote'],
      data['author'],
      data['category'],
    );
  }
}
