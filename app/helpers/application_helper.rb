module ApplicationHelper

  # FAVORITE/UNFAVORITE

  def favorite link_path, id, hide
    style = hide ? 'display: none;' : ''
    link_to link_path, class: "favorite-button", id: "favorite-#{id}", style: style, method: :post, remote:true do
      content_tag(:span, '', class: "icon-heart-empty")
    end
  end

  def unfavorite link_path, id, visible
    style = visible ? '' : 'display: none;'
    link_to link_path, class: "unfavorite-button", id: "unfavorite-#{id}", style: style, method: :delete, remote:true do
      content_tag(:span, '', class: "icon-heart-full")
    end
  end

  # ICON BUTTONS

  def icon_button link_path, icon, text, button_class, icon_on_left, method: :get, confirm:false
    if confirm
      link_to link_path, class: "button button-#{button_class}", method: method, data: {'confirm'=>confirm} do
        if icon_on_left
          concat content_tag(:span, '', class: "fi-#{icon}")
          concat " #{text}"
        else
          concat "#{text} "
          concat content_tag(:span, '', class: "fi-#{icon}")
        end
      end
    else
      link_to link_path, class: "button button-#{button_class}", method: method do
        if icon_on_left
          concat content_tag(:span, '', class: "fi-#{icon}")
          concat " #{text}"
        else
          concat "#{text} "
          concat content_tag(:span, '', class: "fi-#{icon}")
        end
      end
    end
  end

  def back_button link_path, text='Back', icon_on_left:true
    icon_button link_path, 'arrow-left', text, 'back', icon_on_left
  end

  alias_method :prev_button, :back_button

  def edit_button link_path, text:'Edit', icon_on_left:true
    icon_button link_path, 'pencil', text, 'edit', icon_on_left
  end

  def delete_button link_path, text:'Delete', icon_on_left:true
    icon_button link_path, 'trash', text, 'delete', icon_on_left, method: :delete, confirm:true
  end

  def next_button link_path, text='Next', icon_on_left:false
    icon_button link_path, 'arrow-right', text, 'next', icon_on_left
  end

  def add_button link_path, text='Add', icon_on_left:true, icon:'plus'
    icon_button link_path, icon, text, 'add', icon_on_left
  end
  def submit_button text='Submit', icon_on_left:true, icon:'check' 
    content_tag :button, type: 'submit' do 
      concat content_tag(:span, '', class: "fi-#{icon}")
      concat " #{text}"
    end
  end

  # Link Helpers
  def absolute_path_for address
    if address =~ /\/\//
      address
    else
      "http://#{address}"
    end
  end
end
