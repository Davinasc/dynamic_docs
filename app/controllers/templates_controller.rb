class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]
  before_action :set_type, only: :list_by_type

  def index
    @templates = Template.all.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @template = Template.new
  end

  def edit
  end

  def create
    @template = Template.new(template_params)

    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list_by_type
    @templates = Template.where(type_id: @type.id).page(params[:page]).per(5)
    render template: 'templates/index.html.erb'
  end

  private
    def set_template
      @template = Template.find(params[:id])
    end

    def set_type
      @type = Type.find(params[:type_id])
    end

    def template_params
      params.require(:template).permit(:variaveis, :texto, :type_id, :nome)
    end
end
