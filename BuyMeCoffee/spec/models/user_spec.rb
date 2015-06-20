require 'rails_helper'

describe User do
  let(:good_user) { User.new(name: "Antonio", about: 'manentea', pic_loc: 'adadad')}
  let(:bad_user_name) { User.new(about: 'manentea', pic_loc: 'adadad')}
  let(:bad_user_about) { User.new(name: "Antonio", pic_loc: 'adadad')}
  let(:bad_user_pic_loc) { User.new(name: "Antonio", about: 'manentea')}

  it 'true is equal to true' do
    expect(true).to eq(true)
  end

  it 'is valid with all fields present' do
    expect(good_user).to be_valid
  end

  it 'is invalid without all fields present' do
    expect(bad_user_name).to be_invalid
    expect(bad_user_about).to be_invalid
    expect(bad_user_pic_loc).to be_invalid
  end
end