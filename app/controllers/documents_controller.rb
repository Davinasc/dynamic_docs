class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :set_template, only: [:new, :create, :edit, :update]

  def index
    @documents = Document.all
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
    novoDocumento = {
      template_id: document_params["template_id"],
      campos: @document.campos,
      texto: @document.texto
    }
    respond_to do |format|
      if @document.update(novoDocumento)
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

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def set_template
      @template = Template.find(params[:template_id])
    end

    def document_params
      params.require(:document).permit(:template_id, :campos, :texto)
    end
end
