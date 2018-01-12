module Admin
  # admin instructions
  class InstructionsController < AdminController
    before_action :game

    def edit
      @instructions = Instruction.where(game_id: @game.id).order(:step) || []
    end

    def create
      Instruction.where(game_id: @game.id).destroy_all

      step = 1
      instruction_params[:explanations].each do |exp|
        next if exp.blank?
        Instruction.create!(step: step, explanation: exp, game_id: @game.id)
        step += 1
      end
      respond_to do |format|
        format.html { redirect_to [:admin, @game], notice: 'Instructions was successfully registered.' }
      end
    end

    private

    # get game data
    def game
      @game = Game.find(params[:game_id])
    end

    # Strong parameters
    def instruction_params
      params.permit(:game_id, explanations: [])
    end
  end
end
