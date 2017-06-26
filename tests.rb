require 'minitest/autorun'
require './compilateur_logo'

describe CompilateurLogo do
  before do
    @compilateur = CompilateurLogo.new
  end

  describe "la tortue" do
    it "peut avancer" do
      @compilateur.compile("av 1").must_equal "av(1);"
      @compilateur.compile("av 2").must_equal "av(2);"
    end

    it "peut tourner" do
      @compilateur.compile("td 90").must_equal "td(90);"
    end
  end

  it "peut enchainer les instructions" do
    @compilateur.compile("av 1\nav 2").must_equal(
      "av(1);\nav(2);"
    )
  end

end
