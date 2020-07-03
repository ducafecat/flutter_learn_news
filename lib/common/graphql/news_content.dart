const String GQL_NEWS_LIST = r'''
  query News {
    newsContents {
      title
      category
      author
      url
      addtime
      thumbnail {
        url
      }
    }
  }
''';
