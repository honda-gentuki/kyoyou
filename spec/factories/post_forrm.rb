FactoryBot.define do
  factory :post_form do
    school_list        { '小学校' }
    course             { '政治経済' }
    unit               { '選挙の仕組み' }
    introduction       {Faker::Lorem.sentence}
    introduction_time  { 5 }
    development        {Faker::Lorem.sentence}
    development_time   { 30 }
    summary            {Faker::Lorem.sentence}
    summary_time       { 10 }
  end
end