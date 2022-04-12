class LoanAccount  
  def initialize
    @doc = File.open("app/assets/xml/loan.xml") { |f| Nokogiri::XML(f) }
  end
  
  def loan_number
    @doc.xpath("//LoanNumber").text
  end
  
  def borrower_name
    @doc.xpath("//BorrowerName").text
  end
end
