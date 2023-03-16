# require 'rails_helper'

# RSpec.describe 'foods/index', type: :view do
#   before(:each) do
#     assign(:foods, [
#              Food.create!(
#                name: 'Name',
#                measurement_unit: 'Measurement Unit',
#                price: 2,
#                quantity: 3,
#                user: nil
#              ),
#              Food.create!(
#                name: 'Name',
#                measurement_unit: 'Measurement Unit',
#                price: 2,
#                quantity: 3,
#                user: nil
#              )
#            ])
#   end

#   it 'renders a list of foods' do
#     render
#     assert_select 'tr>td', text: 'Name'.to_s, count: 2
#     assert_select 'tr>td', text: 'Measurement Unit'.to_s, count: 2
#     assert_select 'tr>td', text: 2.to_s, count: 2
#     assert_select 'tr>td', text: 3.to_s, count: 2
#     assert_select 'tr>td', text: nil.to_s, count: 2
#   end
# end

require 'rails_helper'

RSpec.feature 'Food show page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  # let(:user_ids) { User.pluck(:id) }
  # let(:post) { Post.first }
  before do
    visit new_user_session_path
  end

  scenario 'Displays details and posts  for a single user' do
    sleep(1)
    expect(page).to have_content('Logafh')
    # expect(page).to have_css("img[src='https://avatars.githubusercontent.com/u/53082877?s=96&v=4']")
    # expect(page).to have_css('li.user div.post-counter-details p', text: 'Number of posts: 5')
    # expect(page).to have_content('Teacher from Mexico.')
    # expect(page).to have_css('li.user', count: 1)
    # expect(page).to have_css('li.post p.comment-heading', text: 'Comments: 0, Likes: 0')
    # expect(page).to have_content('This is my fourth post')
    # expect(page).to have_css('li.post', count: 3)
  end

  # scenario 'Clicking on a see more post redirects to index page for posts' do
  #   click_button 'See all posts'
  #   sleep(1)
  #   expect(current_path).to eq(user_posts_path(user_id: user_ids.last))
  # end

  # scenario 'Clicking on a user redirects to their same page' do
  #   user = User.find_by(name: 'Mancoba')
  #   click_on 'Mancoba'
  #   expect(current_path).to eq(user_path(user.id))
  # end

  # scenario 'Clicking on a post title redirects to showing more more details about post page' do
  #   click_on("Post ##{post.id}")
  #   expect(current_path).to eq(user_posts_path(user_id: post.author_id, id: post.id))
  # end
end
