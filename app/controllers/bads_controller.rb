# encoding : utf-8
class BadsController < ApplicationController

  before_filter :ensure_authentication

  # POST /bads
  def create
    bad = Bad.new(params[:bad])
    bad.save
    redirect_to retrospective_path(params[:retrospective_id])
  end

  # GET /bads/keep
  def keep
    bad = Bad.find(params[:id])
    bad.retrospective_id = params[:retrospective_id]
    bad.preffix_description!
    bad.keep!
    raise RuntimeError, 'Erro ao salvar post-it' unless bad.save
    redirect_to retrospective_path(params[:retrospective_id])
  end

  # GET /bads/keep
  def to_good
    bad = Bad.find(params[:id])
    good = Good.new
    good.retrospective_id = params[:retrospective_id]
    good.description = "Corrigido: #{bad.description}!"
    good.save
    bad.destroy
    redirect_to retrospective_path(params[:retrospective_id])
  end

  # DELETE /bads
  def destroy
    bad = Bad.find(params[:id])
    bad.destroy
    redirect_to retrospective_path(params[:retrospective_id])
  end
end
