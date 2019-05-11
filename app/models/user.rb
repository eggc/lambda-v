require 'open-uri'

class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one_attached :icon
  has_many :external_users

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, if: lambda {
    new_record? || changes[:crypted_password]
  }

  attr_accessor :icon_url
  before_save :attach_icon

  # 予めセットされていた icon_url からデータを取ってきて active storage に icon を保存する
  # ツイッターから取得した icon の場合は xxx_normal.jpg のようなファイル名になっており
  # オリジナル画像よりかなり小さい。これを避けるためファイル末尾の _normal を削除する。
  def attach_icon
    if icon_url.start_with?("https://pbs.twimg.com/profile_images")
      extname = File.extname(icon_url)
      url = icon_url.sub("_normal#{extname}", extname)
    else
      url = icon_url
    end

    downloaded_image = open(url)
    icon.attach(io: downloaded_image, filename: File.basename(url))
  end
end
