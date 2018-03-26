module Rectify
  class BuildFormFromModel
    def initialize(form_class, model)
      @form_class = form_class
      @model = model
    end

    def build
      form_class.new(attributes)
    end

    private

    attr_reader :form_class, :model

    def attribute_set
      form_class.schema
    end

    def matching_attributes
      attribute_set
        .select { |key, _| model.respond_to?(key) }
        .each_with_object({}) { |(key, _value), hsh| hsh[key] = model.send(key) }
    end

    def attributes
      form_class.model_mapping(model).merge(matching_attributes)
    end
  end
end
