class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :theses
  belongs_to :theses, foreign_key: 'chosen_thesis_id'

  validates :firstname, :lastname, presence: true

  def admin?
    admin
  end

  def joined? thesis_id
    chosen_thesis_id == thesis_id
  end
end
