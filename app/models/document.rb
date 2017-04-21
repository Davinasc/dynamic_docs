class Document < ApplicationRecord
  belongs_to :template

  def getCampos(template)
    self.campos = template.variaveis.split(',')
  end

  def getTemplate(template)
    self.texto = template.texto
  end

  def format(template)
    variaveis = template.variaveis.split(',')
    valores = self.campos.split(',')
    data = Hash[variaveis.zip valores]
    self.campos = data
  end

  def atualizarTexto(document)
    document.campos.each { |campo, valor|
      self.texto = document.texto.gsub("#"+"#{campo}", valor)
    }
  end

end
