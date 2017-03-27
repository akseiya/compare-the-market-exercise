=begin

A user obtains a customized energy quote based on their
current usage and predicted savings estimate based on
their current energy spending.

=end

include EnergyCompare
feature 'Energy comparison for gas and/or electricity' do
  
  before do
    use_chromedriver
    visit TestStart
  end
  
  it 'starts at Your Supplier stage' do
    expect(main_header).to have_text 'Your Supplier'

    within(YourSupplier.section('What is your postcode?')) do
      expect(page).to have_field 'postcode'
      expect(page).to have_button 'Find postcode'
      expect(page).to have_no_selector SectionTicked # with custom matchers, this can become `to have_no_tick_sign`
    end
    
    within(YourSupplier.section('Do you have your bill handy?')) do
      expect(page).to have_content 'Yes, I have my bill'
      expect(page).to have_content 'No, I don’t have my bill'
    end

    within(YourSupplier.section('What do you want to compare?')) do
      expect(page).to have_content 'Gas & Electricity'
      expect(page).to have_content 'Electricity only'
      expect(page).to have_content 'Gas only'
    end
    
    expect(page).to have_no_selector(:xpath, YourSupplier.single_supplier_selection)
  end
  
  it 'accepts a post code' do
    YourSupplier.find_the_fixed_postcode
    expect(page).to have_selector SectionTicked # with custom matchers, this can become `to have_tick_sign`
  end
  
  context 'when user has a bill' do
    before :each do
      visit TestStart
      YourSupplier.find_the_fixed_postcode
      YourSupplier.i_have_the_bill.click
    end
    
    it 'allows specifying single provider ' do
      expect(page).to have_selector(:xpath, YourSupplier.single_supplier_selection)
    end
    
  end
end