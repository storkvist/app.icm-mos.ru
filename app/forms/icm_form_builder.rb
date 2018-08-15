class IcmFormBuilder < ActionView::Helpers::FormBuilder
  def number_field_input(method, &block)
    help_text = @template.capture(&block) if block_given?

    text_input(method, help_text: help_text) do |classes|
      number_field(method, class: classes.join(' '))
    end
  end

  def text_field_input(method, help_text: nil)
    text_input(method, help_text: help_text) do |classes|
      text_field(method, class: classes.join(' '))
    end
  end

  def text_area_input(method, help_text: nil)
    text_input(method, classes: ['textarea'], help_text: help_text) do |classes|
      text_area(method, class: classes.join(' '), data: { controller: 'textarea' }, rows: 4)
    end
  end

  private

  def text_input(method, classes: ['input'], help_text: nil)
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
        @template.concat @template.content_tag(:p, help_text, class: 'help') if help_text.present?
      end
    end
  end
end
