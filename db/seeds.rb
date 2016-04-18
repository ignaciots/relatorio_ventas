Role.delete_all
Property.delete_all
User.delete_all
Store.delete_all
Sale.delete_all
Category.delete_all

ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'roles'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'properties'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'stores'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'sales'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'categories'")


r1 = Role.create({name: "regular", description: "Can read sales"})
r2 = Role.create({name: "seller", description: "Can read and create sales. Can update and destroy own sales"})
r3 = Role.create({name: "admin", description: "Can perform any CRUD operation on any resource"})

c1 = Category.create({name: "Deportes & Recreación"})
c2 = Category.create({name: "Supermercado"})
c3 = Category.create({name: "Tecnología"})

p1 = Property.create({name: "Paseo Los Trapenses", address: "Av. Camino Los Trapenses 3515", city: "Santiago"})
p2 = Property.create({name: "Mallsport", address: "Av. Las Condes 13451", city: "Santiago"})
p3 = Property.create({name: "Apumanque", address: "Av. Manquehue Sur 31", city: "Santiago"})

st1 = Store.create({name: "Adidas", number: "206-A", floor: "2", telephone: "2294481", email: "contacto@adidas.cl", category_id: c1.id, property_id: p1.id })
st2 = Store.create({name: "MacOnline", number: "401", floor: "3", telephone: "55555555", email: "contacto@maconline.cl", category_id: c3.id, property_id: p2.id })
st3 = Store.create({name: "Jumbo", number: "500", floor: "1", telephone: "66666666", email: "contacto@jumbo.cl", category_id: c2.id, property_id: p3.id })

u1 = User.create({name: "Sally", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id, store_id: st1.id})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id, store_id: st2.id})
u3 = User.create({name: "Ignacio", email: "itorres@srichile.cl", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id, store_id: st3.id})

s1 = Sale.create({sales_date: "24-12-1983", number_of_bills: 1, bill_sale_amount: 400000, number_of_invoices: 7, invoice_sale_amount: 10000000, store_id: st1.id, user_id: u1.id})
s2 = Sale.create({sales_date: "24-12-2016",number_of_bills: 2, bill_sale_amount: 500000, number_of_invoices: 8, invoice_sale_amount: 11000000, store_id: st2.id, user_id: u2.id})
s3 = Sale.create({sales_date: "24-12-2019",number_of_bills: 3, bill_sale_amount: 600000, number_of_invoices: 9, invoice_sale_amount: 12000000, store_id: st3.id, user_id: u3.id})
