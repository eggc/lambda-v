class ExternalUser < ApplicationRecord
  belongs_to :user

  def token
    decrypt(crypted_token)
  end

  def secret
    decrypt(crypted_secret)
  end

  def token=(raw_token)
    self.crypted_token = encrypt(raw_token)
  end

  def secret=(raw_secret)
    self.crypted_secret = encrypt(raw_secret)
  end

  private

  def encrypt(data)
    encryptor.encrypt_and_sign(data)
  end

  def decrypt(data)
    encryptor.decrypt_and_verify(data)
  end

  def encryptor
    @encrypter ||= ActiveSupport::MessageEncryptor.new(
      Rails.application.credentials.secret_key_base[0...32]
    )
  end
end
