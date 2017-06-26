class CompilateurLogo
  def compile code_logo
    lignes_logo = code_logo.split("\n")

    lignes_logo.map { |ligne|
      mots_logo = ligne.split(" ")

      mot = mots_logo[0]
      pas = mots_logo[1]

      "#{mot}(#{pas});"
    }.join("\n")
  end
end
