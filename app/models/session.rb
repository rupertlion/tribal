# frozen_string_literal: true

class Session < ApplicationRecord
  validates_presence_of :title, :start_date
  belongs_to :price_table
  belongs_to :coach, class_name: 'User'
  has_many :transactions
  has_and_belongs_to_many :users
  enum status: { scheduled: 0, confirmed: 1, full: 2 }

  def set_channel_name
    self.channel_name = title + '_Channel_' + id.to_s
  end
end
