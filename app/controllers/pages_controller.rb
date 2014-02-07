class PagesController < ApplicationController

  def one
    @day = Day.find(2)
    @question = @day.questions.find(3)
    @choices = @question.choices 
  end
  
  def home    
  end
  
  def mobile
  end
  
  def contest
    # participant information here
    # @participant = Participant.find(1)
    
    # start the counter for the beginning of a new session
    
    @day = Day.find(1)
    @question = @day.questions.find(1)
    @choices = @question.choices    
  end
  
  def answer
    # save the answer 
    @answer = Answer.new(answer_params)
    
    if @answer.save
      # check the answer
      @choice = Choice.find(params[:choice_id])
      if @choice.correct 
        render :correct
        # go to the next question if it's not the last question else go to the winner page
      else 
        render :wrong
        # go to sorry page?? try tomorrow or later?
      end          
    else 
        # it didn't saved ignore for now 
    end

  end
  
  private 
  
    def answer_params
      params.permit(:participant_id, :date, :ipaddress, :choice_id)
    end
    
  
end
