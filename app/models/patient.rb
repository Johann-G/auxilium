class Patient < ApplicationRecord

  include AASM
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :invitable

  attr_accessor :skip_password_validation

  has_many :consultations, dependent: :destroy
  belongs_to :doctor

  has_one :chatroom, dependent: :destroy
  has_one :videoroom, dependent: :destroy
  has_many :messages, as: :messageable, dependent: :destroy

  # has_one_attached :photo

  validates :first_name, :last_name, presence: true

  after_create :new_chatroom
  after_create :new_videoroom

  aasm column: 'status' do
    state :draft, initial: true
    state :active
    state :inactive

    event :activate do
      transitions from: :draft, to: :active
    end

    event :deactivate do
      transitions from: :active, to: :inactive
    end
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def full_name
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def full_address
    "#{self.street}, #{self.zip} #{self.city}"
  end

  def next_consultation
    self.consultations.where("consultations.date >= ?", Time.zone.now).order(:date).first
  end

  def last_consultation
    self.consultations.where("consultations.date < ?", Time.zone.now).order(:date).first
  end

  def new_chatroom
    Chatroom.create(patient: self, doctor: self.doctor)
  end

  def new_videoroom
    Videoroom.create(patient: self, doctor: self.doctor)
  end

  private

  def password_required?
    return false if skip_password_validation
  end

end
