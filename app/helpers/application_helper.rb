module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name, class: 'profile_img') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, class: 'profile_img')
  end

  # ajaxでpostするかどうかを判断する関数
  def ajax_or_not
    if action_name == 'show'
      # コメント追加画面はajaxで投稿
      return true
    elsif action_name == 'edit'
      # コメント編集画面はnot ajax
      return false
    end
  end
end
