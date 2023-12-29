class WidgetsController < ApplicationController 
  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: "Sector 7G",
      address: OpenStruct.new(
              id: rand(100),
              country: "UK"
      )
    )

    # Expose only one instance variable to the view.
    # if we also choose to expose @manufacturer to avoid too much nesting
    # the developers would have to go back to the controller to see what's
    # loaded into the manufacturer instance. 
    # By Exposing a single widget everything is connected and simpler.
    @widget = OpenStruct.new(id: params[:id],
                            manufacturer_id: manufacturer.id,
                            manufacturer: manufacturer,
                            name: "Widget #{params[:id]}")

    def @widget.widget_id
      if self.id.to_s.length < 3
        self.id.to_s 
      else
        self.id.to_s[0..-3] + "." + self.id.to_s[-2..-1]
      end 
    end
  end

  def index
    @widgets = [
      OpenStruct.new(id: 1, name: "Stembolt"),
      OpenStruct.new(id: 2, name: "Flux Capacitor"),
    ]
  end
end
