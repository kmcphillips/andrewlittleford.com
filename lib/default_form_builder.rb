class DefaultFormBuilder < ActionView::Helpers::FormBuilder 
  
  def datetime(name, opts={})
    text_field(name, opts.merge(:class => "datetimepicker", :size => 20, :value => self.object.send(name).try(:to_formatted_s, :form).try(:downcase)))
  end
  
  def image
    @template.render :partial => "/shared/image_form", :locals => {:f => self, :object => self.object}
  end
end
