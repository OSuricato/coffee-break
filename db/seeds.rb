Product.destroy_all
User.destroy_all

puts 'starting seed'

user = User.create(
  email: 'business@gmail.com',
  password: '123123',
  first_name: Faker::Name.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.cell_phone,
  is_company: true,
  company_name: Faker::Company.name,
  register_number: Faker::CNPJ.numeric
)
  5.times do
    product = Product.new(
      # name
      name: Faker::Coffee.blend_name,
      # description
      description: Faker::Coffee.notes,
      # region
      region: Faker::Coffee.origin,
      weight: [250, 500, 1000].sample,
      roast_type: ["grain", "coarse", "thin"].sample,
      product_type: ["Coffee", "filter", "grinder", "cup"].sample,
      price: rand(10..150)
    )
    product.user = user
    product.save!
  end

user = User.create(
  email: 'client@gmail.com',
  password: '123123',
  first_name: Faker::Name.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.cell_phone,
  is_company: false,
  company_name: Faker::Company.name,
  register_number: Faker::CNPJ.numeric
)

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: '123123',
    first_name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    is_company: true,
    company_name: Faker::Company.name,
    register_number: Faker::CNPJ.numeric
  )
  puts "usuario criado"
  10.times do
    product = Product.new(
      # name
      name: Faker::Coffee.blend_name,
      # description
      description: Faker::Coffee.notes,
      # region
      region: Faker::Coffee.origin,
      weight: [250, 500, 1000].sample,
      roast_type: ["grain", "coarse", "thin"].sample,
      product_type: ["Coffee", "filter", "grinder", "cup"].sample,
      price: rand(10..150)
    )
    product.user = user
    product.save!
  end
end

20.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123123',
    first_name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    is_company: false,
    company_name: 'client',
    register_number: Faker::CPF.number
  )
  puts "usuario criado"
end

puts 'seed succesfull'
