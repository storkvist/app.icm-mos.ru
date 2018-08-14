class IcmFormBuilder < ActionView::Helpers::FormBuilder
  def text_field_input(method)
    @template.content_tag(:div, class: 'field') do
      @template.capture do
        @template.concat label(method, class: 'label')

        classes = ['input']
        error_text = nil

        if @object.errors.include?(method)
          classes << 'is-danger'
          error_text = @object.errors.full_messages_for(method).join(' ')
        end

        @template.concat @template.content_tag(:div, text_field(method, class: classes.join(' ')))
        @template.concat @template.content_tag(:p, error_text, class: 'help is-danger') if error_text.present?
      end
    end
  end

  def text_area_input(method)
    text_input(method, classes: ['textarea']) { |classes| text_area(method, class: classes.join(' ')) }
  end

  private

  def text_input(method, classes: ['input'])
    @template.content_tag(:div, class: 'field') do
      @template.capture do
        @template.concat label(method, class: 'label')

        error_text = nil

        if @object.errors.include?(method)
          classes << 'is-danger'
          error_text = @object.errors.full_messages_for(method).join(' ')
        end

        @template.concat @template.content_tag(:div, yield(classes))
        @template.concat @template.content_tag(:p, error_text, class: 'help is-danger') if error_text.present?
      end
    end
  end
end
