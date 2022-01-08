class RickAndMortException implements Exception {
  final String? msg;

  RickAndMortException(this.msg);

  @override
  String toString() {
    return msg ?? 'RickAndMortException';
  }
}
