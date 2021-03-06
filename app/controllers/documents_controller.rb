class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy, :gerar_pdf, :gerar_word]
  before_action :set_template, only: [:new, :create, :edit, :update]
  respond_to :docx

  def index
    @documents = Document.all.page(params[:page]).per(5)
    @templates = Template.all
  end

  def show
  end

  def new
    @document = Document.new
    @document.getCampos(@template)
    @document.getTemplate(@template)
    @document.template = @template
  end

  def edit
    @document.texto = @template.texto
    @document.template = @template
  end

  def create
    @document = Document.new(document_params)
    @document.format(@document, @template)
    @document.atualizarTexto(@document)
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @document.campos = document_params["campos"]
    @document.texto = @template.texto
    @document.format(@document, @template)
    @document.atualizarTexto(@document)
    novo_documento = {
      template_id: document_params["template_id"],
      nome: document_params["nome"],
      campos: @document.campos,
      texto: @document.texto
    }
    respond_to do |format|
      if @document.update(novo_documento)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def gerar_pdf
    render template: 'documents/arquivo.pdf.erb', pdf: 'Arquivo', locals: { :document => @document }
  end

  def gerar_word
    render template:'documents/download.docx.erb', docx: 'download',
            locals: { :document => @document }, filename: "#{@document.template.nome}"
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def set_template
      @template = Template.find(params[:template_id])
    end

    def document_params
      params.require(:document).permit(:template_id, :campos, :texto, :nome)
    end
end
