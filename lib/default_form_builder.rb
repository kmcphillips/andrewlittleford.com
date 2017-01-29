class DefaultFormBuilder < ActionView::Helpers::FormBuilder
  def image
    @template.render :partial => "/shared/image_form", :locals => {:f => self, :object => self.object}
  end
end
