module ApplicationHelper
  def default_meta_tags
    {
      site:'ギター指板クイズ',
      title: 'クイズで指板の位置を音名で覚えよう！',
      reverse: true,
      charset: 'utf-8',
      description: '音名をギターので答えるクイズアプリです。',
      keywords: 'ギター, 指板, コード, フレット, アコースティックギター, アコギ',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.png')},
        { href: image_url('favicon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
      }
    }
  end
end
