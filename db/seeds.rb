# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.all.each { |user| user.destroy }
Account.all.each { |account| account.destroy }

@user = User.create(:facebook_id => "10154890767293696")
Account.create(:number => "123", :currency => "RSD", :balance => 12000, :user_id => @user.id)

@user = User.create(:facebook_id => "1797820410448672")
Account.create(:number => "860-0000-12", :currency => "RSD", :balance => 60531, :user_id => @user.id)
