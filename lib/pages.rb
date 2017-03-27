module EnergyCompare
  include Capybara::DSL
  
  TestStart = 'https://energy.comparethemarket.com/energy/v2/?AFFCLIE=TSTT'
  FixedTestPostCode = 'PE2 6YS'
  SectionTicked = '.tick-area'
  
  def main_header
    find('h2.main-heading')
  end
  
  class YourSupplier
    class << self
      
      SectionSelector = ".//div[@class='question-wrapper' and contains(.,'%s')]"
      
      def section_selector(question)
        SectionSelector % question
      end
      
      def single_supplier_selection
        section_selector 'Is your gas & electricity from the same supplier?'
      end
      
      def section(question)
        find :xpath, section_selector(question)
      end
      
      def i_have_the_bill
        find '.have-bill-yes'
      end
      
      def find_the_fixed_postcode
        within(section('What is your postcode?')) do
          fill_in 'postcode', with: FixedTestPostCode
          click_on 'Find postcode'        
        end
      end
    end
  end
end


