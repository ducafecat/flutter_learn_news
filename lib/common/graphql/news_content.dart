const String GQL_NEWS_LIST = r'''

query News($category_code: String) {
  busNews(where: { dict_categories: { code: $category_code } }) {
    title
    dict_channel {
      code
      title
      icon {
        url
      }
    }
    dict_categories {
      code
      title
    }
    author
    url
    addtime
    thumbnail {
      url
    }
  }
}

''';
