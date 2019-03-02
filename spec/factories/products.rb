FactoryBot.define do
  factory :product do
    sequence :name do |n|
      "product#{n}"
    end
    sequence :price do |n|
      (1..1000).to_a.shuffle[n]
    end
    premium_price { price * rand(0..100) / 100 }
    after(:create) do |product|
      product.images.attach(fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'cat.jpg')))
    end
  end
end
