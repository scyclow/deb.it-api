# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@s = User.create!(name:"steve") 
@l = User.create!(name:"liz") 
@j = User.create!(name:"justin") 
@b = User.create!(name:"bob") 

@steve = Account.create!(name:"steve", user:@s)
@liz = Account.create!(name:"liz", user:@l)
@justin = Account.create!(name:"justin", user:@j)
@bob = Account.create!(name:"bob", user:@b)

@loan1 = Loan.create!(creditor: @steve, debtor: @liz, amount: 100.00)
@loan2 = Loan.create!(creditor: @steve, debtor: @liz, amount: 80.00)
@loan3 = Loan.create!(creditor: @liz, debtor: @steve, amount: 90.00)
@loan4 = Loan.create!(creditor: @liz, debtor: @steve, amount: 200.00)
@loan5 = Loan.create!(creditor: @justin, debtor: @steve, amount: 300.00)
@loan6 = Loan.create!(creditor: @justin, debtor: @steve, amount: 450.00)
@loan7 = Loan.create!(creditor: @steve, debtor: @justin, amount: 230.00)
@loan8 = Loan.create!(creditor: @steve, debtor: @justin, amount: 120.00)
@loan9 = Loan.create!(creditor: @steve, debtor: @bob, amount: 100.00)
@loan10 = Loan.create!(creditor: @bob, debtor: @steve, amount: 99.00)