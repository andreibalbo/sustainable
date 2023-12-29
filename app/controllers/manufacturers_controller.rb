class ManufacturersController < ApplicationController 
  def edit
    # .reference data or authentication data are ok to 
    # go on additional instance variables.
    @manufacturer = Manufacturer.find(params[:id])
    @country_codes = CountryCode.all 
  end
end
