FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.last_name }
    email                   { Faker::Internet.free_email }
    password                { 'suzuki12345' }
    password_confirmation   { password }
    last_name               { '鈴木' }
    first_name              { '一郎' }
    last_name_kana          { 'スズキ' }
    first_name_kana         { 'イチロウ' }
    age                     { '20代' }
    sex                     { '男性' }
    school                  { 'テスト第一学校' }
    subject                 { '体育' }
    club                    { '野球' }
    introduce               { 'よろしくお願いします。' }
    image                   { 'app/assets/images/test.png' }
  end
end
