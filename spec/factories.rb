FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Person_#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password              "foobar123"
    password_confirmation "foobar123"

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

  # todo
  # group with memebers
  # group with songs
  # group with feed

  factory :group do
    sequence(:name) { |n| "Group_#{n}" }
    description 'This is the description.'
  end

  factory :text_post do
    content 'wutup homies'
    user
    group
  end

  factory :song_post do
    content 'dis be a great song'
    user
    group
    song
  end

  factory :group_feed do


  end

  factory :group_feed_post do

  end



end
