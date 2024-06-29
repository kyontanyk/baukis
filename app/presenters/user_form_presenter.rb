class UserFormPresenter < FormPresenter
  def password_field_block(name, label_text, options = {})
    # 新規ユーザー登録時のみパスワード入力欄を表示し、
    # 既存ユーザー編集画面ではパスワード入力欄を表示しない。
    if form_builder.object.new_record?
      super(name, label_text, options)
    end
  end

  def full_name_block(name1, name2, label_text, options = {})
    markup(:div, class: 'input_block') do |m|
      m << decorated_label(name1, label_text, options)
      m << text_field(name1, options)
      m << text_field(name2, options)
      m << error_messages_for(name1)
      m << error_messages_for(name2)
    end
  end
end
