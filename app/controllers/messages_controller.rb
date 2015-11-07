class MessagesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @messages = Message.all
  end

  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
      respond_to do |format|
        if @message.save
          format.html { redirect_to @message, notice: 'message was successfully created.' }
          format.json { render '/messages/show.html.erb', status: :created, location: @message }
        else
          format.html { render :new }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_message
        @message = message.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def message_params
        params.require(:message).permit(:sender_id, :receiver_id, :subject, :body)
      end
end
