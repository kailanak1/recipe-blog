class Api::V1::StepsController < ApplicationController

    def index 
        @steps = Step.all 
        render json: @steps
    end

    def create 
        @step = Step.create(step_params)
        # if @step.valid? 
        #     @step.save 
            render json: { Step: StepSerializer.new(@step)}
        # else 
        #     render json: { error: "failed to create event"}, status: :not_acceptable 
        # end
    end

    def show 
        @step = Step.find(params[:id])
        if @step
            render json: @step 
        else 
            render json: { error: "That step does not exist...yet"}, status: :not_acceptable
        end
    end

    def edit 
        @step = Step.find(params[:id])
    end

    def update
        @step = Step.find(params[:id])
        @step.update(step_params)
        render json: @step
    end

    def destroy 
        @step = Step.find(params[:id])
        if @steps 
            @steps.destroy 
            render json: {message: "Step successfully deleted"}
        else 
            render json: {message: "Failed to destroy Step"}
        end
    end

    private 

    def step_params 
        params.require(:step).permit(:recipe_id, :step_summary)
    end

end
