# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user1 = User.create(name: 'Bill', email: 'Bill@Bill.Bill', password: 'Bob')
@category1 = Category.create(title: 'dogs')
@gif1 = @category1.gifs.create(gif_url: 'www.testurl.com/test1')
@gif2 = @category1.gifs.create(gif_url: 'www.testurl.com/test2')
@category2 = Category.create(title: 'cats')
@gif3 = @category2.gifs.create(gif_url: 'www.testurl.com/test3')
@gif4 = @category2.gifs.create(gif_url: 'www.testurl.com/test4')
