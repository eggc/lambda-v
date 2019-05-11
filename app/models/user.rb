class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one_attached :icon

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, if: lambda {
    new_record? || changes[:crypted_password]
  }

  attr_accessor :icon_url
  before_save :attach_icon

  # 予めセットされていた icon_url からデータを取ってきて active storage に icon を保存する
  def attach_icon
    downloaded_image = open(icon_url)
    icon.attach(io: downloaded_image, filename: File.basename(icon_url))
  end
end
