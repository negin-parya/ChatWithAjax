class MessagesController < ApplicationController

before_filter :authenticate 
before_filter :load_user


def index
  @messages=Message.where('receiver_id IS null')
end 

def userMessage
  @messages=Message.all 
end

def privateMessages
 @private_messages=Message.where('receiver_id= :rec', :rec=>current_user.id)
end

def sendmessage
     @message=Message.new(:message_text => params[:id], :user_id => current_user.id, :sender_id => current_user.id)
     @message.save
      respond_to do |format|
        format.html { redirect_to(messages_path)}
        format.js
      end
end

def sendprivate
      parametr = params[:id].to_s
      index = parametr.index("-")
      recieverid = parametr[0, index]
      messagetxt = parametr[index+1, parametr.length]
      @message=Message.new(:message_text => messagetxt, :user_id => current_user.id, :sender_id => current_user.id, :receiver_id => recieverid.to_i(base=10))
      if @message.save
         respond_to do |format|
             format.html { redirect_to '/userMessage/'+recieverid }
             format.js
         end  
     else 
         respond_to do |format|
             format.html { redirect_to '/messages' }
             format.js
         end
     end
end  

 private 
  def load_user
   if params[:user_id]!=nil then
    @user= User.find(params[:user_id])
   end
  end


end
