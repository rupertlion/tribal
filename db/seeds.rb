Session.destroy_all
PriceTable.destroy_all

PriceTable.create(trainees: 4, pricePoint: 2)
PriceTable.create(trainees: 4, pricePoint: 1)
pricetable = PriceTable.create(trainees: 4, pricePoint: 0)

5.times do 
    Session.create(title: 'Crossfit', startDate: '2019-02-01 15:00:00', status: 0, price_table_id: pricetable.id)
end

5.times do 
    Session.create(title: 'Body Pump', startDate: '2019-02-01 15:00:00', status: 1, price_table_id: pricetable.id)
end

5.times do 
    Session.create(title: 'Yoga', startDate: '2019-02-01 15:00:00', status: 2, price_table_id: pricetable.id)
end