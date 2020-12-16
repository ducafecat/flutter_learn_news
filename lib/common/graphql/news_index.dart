const String GQL_INDEX_PAGE = r'''

query pageIndex {
  # 分类
  dictCategories(sort: "sortNum:desc") {
    code
    title
  }
  # 频道
  dictChannels(sort: "sortNum:desc") {
    code
    title
    icon {
      url
    }
  }
  # 热点
  busNews(where: { dict_categories: { code: "news_hot" } }) {
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
