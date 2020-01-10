class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # usernameを必須・一意とする
  validates_uniqueness_of :username
  # validates_presence_of :username

  # 権限設定が必要であれば、User モデルに user_type を作成して、settings.yml を整列する。
  #
  # validates :user_type, presence: true
  #
  # enum user_type: {
  #     admin: 1 # 管理者
  # }
  #
  # def permission_allow?(controller_name, permission)
  #   return true if controller_name == 'sessions'
  #   return false if Settings.permissions[self.user_type][controller_name].blank?
  #   Settings.permissions[self.user_type][controller_name].include?(permission)
  # end
end
