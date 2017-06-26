class CompilateurLogo
  def compile code_logo
    lignes_logo = code_logo.split("\n")

    code_draw = []
    code_procedures = []

    code_cible = code_draw

    lignes_logo.each { |ligne|
      mots_logo = ligne.split(" ")

      mot = mots_logo[0]

      if mot.nil? then
      elsif mot == "pour" then
        nom = mots_logo[1]

        code_procedures << "}"
        code_procedures << "void #{nom}(){"

        code_cible = code_procedures
      elsif mot == "fin" then
        code_cible = code_draw
      else
        pas = mots_logo[1]

        code_cible << "#{mot}(#{pas});"
      end
    }

    if code_procedures.length > 0 then
      code_draw += code_procedures
    end
    code_draw.join("\n")
  end
end
