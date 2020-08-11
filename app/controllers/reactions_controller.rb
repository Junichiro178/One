class ReactionsController < ApplicationController
  def create
    reaction = Reaction.find_or_initialize_by(to_user_id: params[:user_id], from_user_id: current_user.id)
    # to_user_idの値がスワイプされたユーザのIDと一致し、from_user_idの値が現在ログイン中のユーザと一致するリアクションを格納する
    reaction.update_attributes(
      status: params[:reaction]
    )
  end
end
