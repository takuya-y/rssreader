require 'rss'

# ITmedia
# ITmedia 総合記事一覧
# http://rss.itmedia.co.jp/rss/2.0/itmedia_all.xml
# 速報
# http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml
# 国内記事
# http://rss.itmedia.co.jp/rss/2.0/news_domestic.xml
# ベンチャー人
# http://rss.itmedia.co.jp/rss/2.0/news_venture.xml
class Rssreader
  def rssrun
    # 前回のデータを削除する
    Topic.delete_all

    urls = ["http://rss.itmedia.co.jp/rss/2.0/itmedia_all.xml",
            "http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml",
            "http://rss.itmedia.co.jp/rss/2.0/news_domestic.xml",
            "http://rss.itmedia.co.jp/rss/2.0/news_venture.xml"]

    urls.each do |url|
      rss = RSS::Parser.parse(url)

      rss.items.each do |item|
        product = Topic.where(title: item.title, link: item.link).first_or_initialize
        product.save
      end
    end
  end
end