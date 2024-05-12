class DiaryEntriesController < ApplicationController
  before_action :require_login
  before_action :set_diary_entry, only: [:show, :edit, :update, :destroy]

  def new
    @date = params[:date]
    @diary_entry = Diary.new
    @diary_entry.videos.build
    @diary_entry.videos.build # 2つ目の動画フィールドを作成
  end

  def create
    @diary_entry = current_user.diaries.build(diary_entry_params)
    @diary_entry.status = :published # ステータスを公開に設定
    logger.debug "Diary Entry Params: #{diary_entry_params.inspect}"
    if @diary_entry.save
      logger.debug "Diary Entry saved successfully"
      redirect_to diary_entry_path(@diary_entry), notice: '日記が作成されました。'
    else
      logger.debug "Diary Entry failed to save: #{@diary_entry.errors.full_messages}"
      flash.now[:alert] = '日記の作成に失敗しました。'
      render :new
    end
  end
  

  def show
  end

  def edit
  end

  def update
    if @diary_entry.update(diary_entry_params)
      redirect_to diary_entry_path(@diary_entry), notice: '日記が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @diary_entry.destroy
    redirect_to calendar_path, notice: '日記が削除されました。', status: :see_other
  end

  private

  def set_diary_entry
    @diary_entry = Diary.find(params[:id])
  end

  def diary_entry_params
    params.require(:diary).permit(:date, :content, videos_attributes: [:file_path, :title, :artist, :status])
  end
end