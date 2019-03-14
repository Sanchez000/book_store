FactoryBot.define do
  factory :category, class: Category do
    title { Category::CATEGORIES_LIST.sample }
  end

  factory :first_category, class: Category do
    title { Category::CATEGORIES_LIST.first }
  end

  factory :second_category, class: Category do
    title { Category::CATEGORIES_LIST.second }
  end

  factory :third_category, class: Category do
    title { Category::CATEGORIES_LIST.third }
  end

  factory :fourth_category, class: Category do
    title { Category::CATEGORIES_LIST.fourth }
  end
end
