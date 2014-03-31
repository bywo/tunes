FactoryGirl.define do
  factory :user do
    # sequence(:name) { |n| "Person_#{n}" }
    # sequence(:email) { |n| "person_#{n}@example.com" }
    # password              "foobar"
    # password_confirmation "foobar"

    # factory :admin do
    #   admin true
    # end
  end

  factory :song do
    title 'Song Title'
    artist 'Song Artist'
  end

  factory :sound do
    sound_type 'youtube'
    location 'somewhere1234'
    song
  end

  factory :song_collection do

  end

  factory :group do


  end

  factory :group_feed do


  end

  factory :group_feed_post do

  end



end