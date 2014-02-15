class PagesController < ApplicationController


  def one
    @day = Day.find(2)
    @question = @day.questions.find(3)
    @choices = @question.choices 
  end

  include PagesHelper


  before_filter :sign_up_first, :except => [:home, :participate]

  

  
  def home
    # make the session id nil 
    session[:participant_id] = nil
    @num_of_questions = [1,2,3,4,5,6,7,8,9,10]         
    session[:num_of_questions] =  @num_of_questions
  end
  
  def participate 
    # find if the participant already exist 
    @participant = Participant.find_by_email(params[:participant][:email])
    if @participant.nil? 
      # create the participant here 
      @participant = Participant.new(participant_params)
      if @participant.save 
        session[:participant_id] ||= @participant.id      
        redirect_to contest_path  
      else 
        redirect_to root_path   
      end
    else 
      # if participant already exist 
      @participant.update(participant_params)
      session[:participant_id] ||= @participant.id      
      redirect_to contest_path        
    end    
  end
  
  
  def mobile
  end
  
  def contest
    

    # get the current participant
    @participant = Participant.find(session[:participant_id])
    
    @day = Day.find(1)
    
    # get the question here
    @num = session[:num_of_questions].shuffle!.pop

    @level = session[:num_of_questions].size
    unless @num.nil? 
      @question = @day.questions.find_by(num: @num)
      @choices = @question.choices
    else
      redirect_to win_path
    end      
  end
  
  def win
    render :winner
  end
  
  def answer
    # save the answer 
    @answer = Answer.new(answer_params)
    
    if @answer.save
      # check the answer
      @choice = Choice.find(params[:choice_id])
      if @choice.correct
        @level = session[:num_of_questions].size 
        render :correct
        # go to the next question if it's not the last question else go to the winner page
      else 
        session[:num_of_questions] = [1,2,3,4,5,6,7,8,9,10]
        session[:level] = 0
        render :incorrect
        # go to sorry page?? try tomorrow or later?
      end          
    else 
        # it didn't saved ignore for now 
    end

  end
  
  private 
  
    def participant_params
      params.require(:participant).permit(:email, :subscribed)
    end
    
    def answer_params
      params.permit(:participant_id, :date, :ipaddress, :choice_id)
    end
    
  
end
