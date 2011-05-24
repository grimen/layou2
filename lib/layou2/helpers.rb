# encoding: utf-8

module Layou2
  module Helpers

    def title(*args, &block)
      options = args.extract_options!
      options[:meta] = false if options[:meta].nil?
      options[:as] ||= ::Layou2.default_title_tag

      # TODO: refactor
      (args ||= []).each do |arg|
        case arg
        when String then
          title = arg
        when Symbol then
          options[arg] = true
        end
      end

      title ||= capture_if_given(&block)
      title = t('.title', options.except(:class, :meta, :as, :strip)) if title.blank? # TODO: bottom-up I18n lookups
      title = title.textilize(:strip) if options[:textile]
      # TODO: meta(:title, title) if options.delete(:meta)
      options[:class] = [::Layou2.dom_classes[:title], options[:class]].compact.join(' ')

      content_tag(options[:as] , title, options.slice(:class)) # TODO: Only :class?
    end

    def description(*args, &block)
      options = args.extract_options!
      options[:meta] = false if options[:meta].nil?
      options[:as] ||= ::Layou2.default_description_tag

      # TODO: refactor
      (args ||= []).each do |arg|
        case arg
        when String then
          description = arg
        when Symbol then
          options[arg] = true
        end
      end

      description ||= capture_if_given(&block)
      description = t('.description', options.except(:class, :meta, :as, :strip)) if description.blank? # TODO: bottom-up I18n lookups
      description += options[:end_with] if options[:end_with] && description[-1,1] != options[:end_with]
      description = description.textilize(:strip) if options[:textile]
      # TODO: (:description, description) if options.delete(:meta)
      options[:class] = [::Layou2.dom_classes[:description], options[:class]].compact.join(' ')

      content_tag(options[:as], description, options.slice(:class)) # TODO: Only :class?
    end

    def keywords(*args, &block)
      options = args.extract_options!
      options[:meta] = false if options[:meta].nil?

      # TODO: refactor
      (args ||= []).each do |arg|
        case arg
        when String then
          keywords = arg
        when Symbol then
          options[arg] = true
        end
      end

      keywords ||= capture_if_given(&block)
      keywords = t('.keywords', options.except(:meta)) if keywords.blank? # TODO: bottom-up I18n lookups
      # TODO: meta(:keywords, description) if options.delete(:meta)

      nil
    end

    def meta(*args)
      options = args.extract_options!

      if args.first.is_a?(Symbol) && args.last.is_a?(String)
        content_for(args.first, args.last)
      else
        ''.tap do |html|
          options.slice(:title, :description, :keywords).each do |type|
            html << content_for(type, options[type])
          end
        end
      end
    end

    # meta_tag :title
    # meta_tag :title, "Untitled"
    # meta_tags :title => "Untitled", :keywords => 'default,tags'
    def meta_tags(*args)
      options = args.extract_options!

      if args.first.is_a?(Symbol) && args.last.is_a?(String)
        send :"#{args.first}_tag", (args.last if args.last.present?)
      else
        ''.tap do |html|
          options.slice(:title, :description, :keywords).each do |type|
            html << send(:"#{type}_tag", (options[type] if options[type].present?))
          end
        end
      end
    end
    alias :meta_tag :meta_tags

    def default_content_types(encoding = 'utf-8')
      content_type_tag(:'content-type', "text/html;charset=#{encoding.upcase}") <<
      content_type_tag(:'content-script-type', 'text/javascript') <<
      content_type_tag(:'content-style-type', 'text/css')
    end

    def title_tag(default = ::I18n.t('meta.default_title', :default => ''))
      content_tag(:title, @content_for_title || default)
    end

    def description_tag(default = ::I18n.t('meta.default_description', :default => ''))
      content = @content_for_description || default
      tag(:meta, :name => 'description', :content => content) unless content.blank?
    end

    def keywords_tag(default = ::I18n.t('meta.default_keywords', :default => ''))
      content = @content_for_keywords || default
      tag(:meta, :name => 'keywords', :content => content) unless content.blank?
    end

    def content_type_tag(http_equiv, content)
      tag(:meta, :'http-equiv' => http_equiv, :content => content)
    end

    def html_attributes(doctype_base = :xhtml, lang = ::I18n.locale)
      attrs = if doctype_base == :html
        {:lang => lang}
      else
        {:xmlns => 'http://www.w3.org/1999/xhtml', :'xml:lang' => lang}
      end
    end

    def body_attributes
      {
        :id => "#{controller.controller_name}",
        :class => "#{controller.action_name}"
      }
    end

    private

      def capture_if_given(else_content = nil, &block)
        if block_given?
          self.capture(&block)
        else
          else_content.to_s
        end
      end

  end
end