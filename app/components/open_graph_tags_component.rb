class OpenGraphTagsComponent < ApplicationComponent
  def initialize(title: nil, description: nil)
    @title = title
    @description = description
  end

  def title
    @title || "hirethePIVOT"
  end

  def description
    @description || t("open_graph_tags_component.default_description")
  end

  def url
    root_url
  end

  def image
    nil
  end

  def twitter
    "@rabbigreenberg"
  end
end
