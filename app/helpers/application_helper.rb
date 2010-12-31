module ApplicationHelper
  
  def page_title
    prefix = PAGE_TITLE
    prefix = "#{prefix} - Admin" if params[:controller] =~ /^admin\//

    if @title
      @title.blank? ? prefix : "#{prefix} - #{@title}"
    elsif params[:controller] =~ /blocks$/
      "#{prefix} - #{params[:action].humanize}"
    elsif params[:controller] !~ /^admin\//
      "#{prefix} - #{params[:controller].humanize}"
    else
      prefix
    end
  end
  
  def index_entity_image(path, label=nil, args={})
    path = polymorphic_path(path) if path.is_a?(Array)
    html = link_to image_tag("/images/icons/index.png", :alt => "Index"), path, :title => "Index", :class => "action-image"
    html += "&nbsp;".html_safe + link_to(label, path) if label
    html
  end

  def new_entity_image(path, label=nil, args={})
    path = polymorphic_path(path) if path.is_a?(Array)
    html = link_to image_tag("/images/icons/new.png", :alt => "New"), path, :title => "New", :class => "action-image"
    html += "&nbsp;".html_safe + link_to(label, path) if label
    html
  end

  def destroy_entity_image(path, label=nil, args={})
    path = polymorphic_path(path) if path.is_a?(Array)
    html = link_to image_tag("/images/icons/delete.png", :alt => "Delete"), path, :method => :delete, :confirm => "Are you sure you want to delete this?", :title => "Delete", :class => "action-image"
    html += "&nbsp;".html_safe + link_to(label, path, :method => :delete, :confirm => "Are you sure you want to delete this?") if label
    html
  end

  def edit_entity_image(path, label=nil, args={})
    path = polymorphic_path(path) if path.is_a?(Array)
    html = link_to image_tag("/images/icons/edit.png", :alt => "Edit"), path, :title => "Edit", :class => "action-image"
    html += "&nbsp;".html_safe + link_to(label, path) if label
    html
  end

  def show_entity_image(path, label=nil, args={})
    path = polymorphic_path(path) if path.is_a?(Array)
    html = link_to image_tag("/images/icons/show.png", :alt => "Show"), path, :title => "Show", :class => "action-image"
    html += "&nbsp;".html_safe + link_to(label, path) if label
    html
  end

  def enlarge_button
    "Enlarge&nbsp;" + image_tag("/images/icons/magnify.png", :alt => "Enlarge", :class => :magnify)
  end

  def boolean_image(value)
    image_tag("/images/icons/#{!!value}.png", :alt => (!!value).to_s.humanize)
  end

  def obfuscated_mail_to(email, label=nil)
    obfuscated = email.scan(/.{1,10}/).join("[REMOVE_THIS]")
    mail_to(email, label, :encode => "javascript") + "<noscript>#{mail_to(obfuscated, label || email.sub(/\@.*/, ""))}</noscript>".html_safe
  end

  def collection_index(collection, column_titles, options={}, &block)
    content_tag(:table, :class => (options[:class] || "data"), :id => options[:id]) do
      src = ""

      src << content_tag(:tr, :class => options[:tr_class], :id => options[:tr_id]) do
        headers = ""
        column_titles.each do |title|
          headers << content_tag(:th, title)
        end
        headers
      end
      
      src << content_tag(:tbody) do
        collection.map do |item|
          yield(item)
        end.join(" ")
      end

      if collection.paginate?
        src << content_tag(:tr) do
          content_tag(:th, :colspan => column_titles.size) do
            will_paginate(collection, :previous_label => "← Newer", :next_label => "Older →")
          end
        end
      end

      src
    end
  end

  def truncate_for_index(str)
    truncate(str, :length => 120, :omission => " (more..)")
  end

  def error_messages(object)
    render :partial => "/shared/error_messages", :object => object
  end

  def admin?
    params[:controller] =~ /^admin\//
  end

  def unique_previous_images(obj)
    fingerprints = []

    obj.class.order("created_at DESC").where("id != ?", obj.id).map do |current|
      if current.image.exists? && current.image.fingerprint
        if fingerprints.include?(current.image.fingerprint)
          nil
        else
          fingerprints << current.image.fingerprint
          current
        end
      end
    end.compact
  end

  def row_class
    cycle("odd", "even")
  end


  ## Overridden paths
  def post_path(post)
    "/news/#{post.permalink}"
  end

  def posts_path
    "/"
  end

  def track_path(track)
    "/player/#{track.id}"
  end

  def admin_gallery_path(gallery)
    "/admin/galleries/#{gallery}"
  end

end

