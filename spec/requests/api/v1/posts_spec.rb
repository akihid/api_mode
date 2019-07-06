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

  it '特定のpostを取得する' do
    post = FactoryBot.create(:post, title: 'テスト用')

    get "/api/v1/posts/#{post.id}"
    json = JSON.parse(response.body)

    # リクエスト成功
    expect(response.status).to eq(200)

    # 特定のポスト取得
    expect(json['data']['title']).to eq(post.title)
  end

  it '新しいpostを作成する' do
    valid_params = { title: '新しいタイトル'}

    # データ作成確認( change.byは値の増減を、相対値で検証する。)
    expect { post '/api/v1/posts', params: { post: valid_params} }.to change{Post.count}.by(1)
    # expect { post '/api/v1/posts', params: { post: valid_params } }.to change(Post, :count).by(+1)

    # リクエスト成功
    expect(response.status).to eq(200)
  end
end