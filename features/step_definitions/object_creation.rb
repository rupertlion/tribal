# frozen_string_literal: true

Given('the following sessions exist') do |table|
  table.hashes.each do |session|
    if session[:coach]
      session_coach = User.coach.find_by(email: session[:coach])
      session.except!(:coach)[:coach] = session_coach
    end
    create(:session, session)
  end
end

Given('the following price table exists') do |table|
  table.hashes.each do |price_table|
    create(:price_table, price_table)
  end
end

Given('the following user(s) exists') do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end
