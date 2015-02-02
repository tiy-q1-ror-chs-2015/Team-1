$.showAlert('<%= j message %>', '<%= j type.to_s %>')

<% if defined?(id) %>
$.toggleFavoriteButtons(<%= id %>)
<% end %>