class EssayForm < Reform::Form

  include Coercion

  property :topic, validates: { presence: true }
  property :essay_title, validates: { presence: true }
  property :content, validates: { presence: true, length: { minimum: 50 } }
end