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

  it "ignore les lignes vides" do
    @compilateur.compile("\nav 1\n").must_equal("av(1);")
  end

  it "peut apprendre des mots" do
    @compilateur.compile("pour x\nav 10\nfin\nx").must_equal(
      "x();\n}\nvoid x(){\nav(10);"
    )
  end

  it "connait les arguments" do
    @compilateur.compile("pour f :x\nav :x\nfin\nf 12").must_equal(
      "f(12);\n}\nvoid f(Object x){\nav(x);"
    )
  end

end
