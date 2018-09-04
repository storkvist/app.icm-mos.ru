class IcmFormBuilder < ActionView::Helpers::FormBuilder
  def file_field_input(method)
    @template.content_tag(:div, class: 'field') do
      @template.content_tag(:div, class: 'file has-name is-fullwidth', data: { controller: 'file' }) do
        @template.content_tag(:label, class: 'file-label') do
          @template.capture do
            @template.concat file_field(method, class: 'file-input', data: { target: 'file.input' })
            @template.concat file_icon(method)

            filename = @object.send(method).try(:filename) || ''
            @template.concat @template.content_tag(:span, filename, class: 'file-name', data: { target: 'file.filename' })
          end
        end
      end
    end
  end

  def number_field_input(method, &block)
    help_text = @template.capture(&block) if block_given?

    text_input(method, help_text: help_text) do |classes|
      number_field(method, class: classes.join(' '))
    end
  end

  def select_input(method, collection, value_method, text_method, prompt: nil)
    @template.content_tag(:div, class: 'field') do
      @template.capture do
        select = @template.content_tag(:div, class: 'select') do
          select(method, @template.options_from_collection_for_select(collection, value_method, text_method, @object.send(method)), prompt: prompt)
        end

        @template.concat(label(method, class: 'label'))
        @template.concat(select)
      end
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

  def file_icon(method)
    @template.content_tag(:span, class: 'file-cta') do
      @template.capture do
        @template.concat @template.content_tag(:span, @template.content_tag('i', nil, class: 'fas fa-upload'), class: 'file-icon')

        action = @object.send(method).attached? ? 'Обновить' : 'Загрузить'
        label = [action, I18n.t("activerecord.attributes.#{@object.class.model_name.singular}.#{method}")].join(' ')
        @template.concat @template.content_tag(:span, label, class: 'file-label')
      end
    end
  end

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
