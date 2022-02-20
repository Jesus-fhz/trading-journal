# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Type.destroy_all

type1 = Type.create! name: 'Break Even'
type2 = Type.create! name: 'Stop loss'
type3 = Type.create! name: 'Take Profit'
type4 = Type.create! name: 'Liquidated'

puts "Types created #{ Type.all.pluck(:name).join(' - ')}"

User.destroy_all

u1 = User.create!(
    name: 'Jesus',
    last_name: 'Flores',
    email: 'hola@ga.com',
    dob: '1993/02/25',
    password: 'chicken'
)

u2 = User.create!(
    name: 'Yuliana',
    last_name: 'Flores',
    email: 'jfss@ss.com',
    dob: '1993/02/25',
    password: 'chicken'
)
puts "Users created #{ User.all.pluck(:name).join(' *** ')  }"


Perpetual.destroy_all

p1 = Perpetual.create perpetual_type: "long"
p2 = Perpetual.create perpetual_type: "short"

puts "Perpetuals created #{ Perpetual.all.pluck(:perpetual_type).join(' *** ')} "

Trade.destroy_all

t1 = Trade.create!(
    entry_date: '2022/01/15',
    platform: 'Binance',
    symbol: 'BTC/USDT',
    entry_price: 100.12,
    entry_amount: 200,
    leverage: 5,
    exit_date: '2002/01/16',
    profit: 48.74151018777462,
    exit_price: 105,
    type_id: type1.id,
    user_id: u1.id,
    perpetual_id: p1.id
) 

t2 = Trade.create!(
    entry_date: '2022/01/15',
    platform: 'Coinbase',
    symbol: 'ETH/USDT',
    entry_price: 44,
    entry_amount: 122,
    leverage: 20,
    exit_date: '2002/01/16',
    profit: -9.614262295081957,
    exit_price: 105,
    type_id: type3.id,
    user_id: u2.id,
    perpetual_id: p2.id
) 



t3 = Trade.create!(
    entry_date: '2022/01/15',
    platform: 'Spooky Swap',
    symbol: 'FTM/USDT',
    entry_price: 3.5,
    entry_amount: 4000,
    leverage: 25,
    exit_date: '2002/01/16',
    profit:2900000.0,
    exit_price: 105,
    type_id: type1.id,
    user_id: u1.id,
    perpetual_id: p1.id
) 

t4 = Trade.create!(
    entry_date: '2022/01/15',
    platform: 'Spooky Swap',
    symbol: 'FTM/USDT',
    entry_price: 3.5,
    entry_amount: 4000,
    leverage: 25,
    exit_date: '2002/01/16',
    profit: 0,
    exit_price: 105,
    type_id: type1.id,
    user_id: u1.id,
    perpetual_id: p1.id
) 

t5 = Trade.create!(
    entry_date: '2022/01/15',
    platform: 'Spooky Swap',
    symbol: 'FTM/USDT',
    entry_price:22,
    entry_amount: 33,
    leverage: 25,
    exit_date: '2002/01/16',
    profit: 0,
    exit_price: 105,
    type_id: type1.id,
    user_id: u1.id,
    perpetual_id: p1.id
) 
t6 = Trade.create!(
    entry_date: '2022/01/15',
    platform: 'Spooky Swap',
    symbol: 'FTM/USDT',
    entry_price: 3.5,
    entry_amount: 4000,
    leverage: 25,
    exit_date: '2002/01/16',
    profit: 0,
    exit_price: 105,
    type_id: type1.id,
    user_id: u1.id,
    perpetual_id: p1.id
) 

#Destroy all Journals entries
Journal.destroy_all

#Create Seeds for journal
j1 = Journal.create!(
    notes: "This trade wasn't the best one, I SHOULD NOVE LEVAREGE more the X5",
    journal_date: DateTime.now.strftime('%Y/%m/%d'),
    trade_id: t3.id
)

j2 = Journal.create!(
    notes: "Repeated the trade without levarge this time it wokerd",
    journal_date: DateTime.now.strftime('%Y/%m/%d'),
    trade_id: t3.id
)

j3 = Journal.create!(
    notes: "When doing stop loss I should have set up a  better support",
    journal_date: DateTime.now.strftime('%Y/%m/%d'),
    trade_id: t1.id
)

puts "Journals created #{ Trade.count }"





# u1.mixtapes << mix1 << mix3
# u2.mixtapes << mix2

# puts "User #{ User.first.name } has mixtapes: #{User.first.mixtapes.pluck(:name).join(' , ')}"
# puts "Mixtape '#{ Mixtape.first.name } belongs to #{ Mixtape.first.user.name } '"

