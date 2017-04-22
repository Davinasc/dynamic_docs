class Document < ApplicationRecord
  belongs_to :template

  def getCampos(template)
    self.campos = template.variaveis.split(',')
  end

  def getTemplate(template)
    self.texto = template.texto
  end

  def format(document, template)
    variaveis = template.variaveis.split(',')
    valores = document.campos.split(',')
    data = Hash[variaveis.zip valores]
    document.campos = data
  end

  def atualizarTexto(document)
    document.campos.each { |campo, valor|
      document.texto = document.texto.gsub("#"+"#{campo}", valor)
    }
  end

end
