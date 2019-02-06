Session.destroy_all
PriceTable.destroy_all
User.destroy_all

trainee = User.create(first_name: 'John', last_name: 'Trainee', email: 'trainee@mail.com', password: 'password', role: 0)
coach = User.create(first_name: 'Jack', last_name: 'Coach', email: 'coach@mail.com', password: 'password', role: 1)

low = PriceTable.create(price_point: 0, trainee_1: 60, trainee_3: 25, trainee_4: 20, trainee_5: 15, trainee_6: 10)
medium = PriceTable.create(price_point: 1, trainee_1: 120, trainee_3: 50, trainee_4: 40, trainee_5: 30, trainee_6: 20)
high = PriceTable.create(price_point: 2, trainee_1: 180, trainee_3: 75, trainee_4: 60, trainee_5: 45, trainee_6: 30)

3.times do
    Session.create(title: 'Crossfit', start_date: '2019-02-01 15:00:00', status: 0, price_table_id: low.id)
end

3.times do
    Session.create(title: 'Body Pump', start_date: '2019-02-01 15:00:00', status: 1, price_table_id: medium.id)
end

3.times do
    Session.create(title: 'Yoga', start_date: '2019-02-01 15:00:00', status: 2, price_table_id: high.id)
end
