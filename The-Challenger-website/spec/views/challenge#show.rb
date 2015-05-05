require 'spec_helper'

describe 'challenge/show.html.erb' do

  it 'displays challenges correctly' do
    assign(:challenge, Challenge.create(name: 'testing',path: 'path', upload_type: 'Image',
    	 sharing_type: 'Public'))

    render  


    rendered.should have_selector("table#challenge_#{@challenge.id} tbody tr:nth-of-type(1) 
    	td:nth-of-type(1)", text: 'testing')
    rendered.should have_selector("table#challenge_#{@challenge.id} tbody tr:nth-of-type(1)
     td:nth-of-type(2)", text: 'path')
    rendered.should have_selector("table#challenge_#{@challenge.id} tbody tr:nth-of-type(1)
     td:nth-of-type(2)", text: 'Image')


  end
end
