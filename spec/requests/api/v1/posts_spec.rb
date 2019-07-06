require 'rails_helper'

describe 'PostAPI' do
  it '全てのポストを取得する' do
    FactoryBot.create_list(:post, 5)

    get '/api/v1/posts'
    json = JSON.parse(response.body)

    # リクエスト成功
    expect(response.status).to eq(200)

    # データが正しい
    expect(json['data'].length).to eq(5)
  end
end