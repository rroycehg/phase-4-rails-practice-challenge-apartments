class TenantsController < ApplicationController

    def index
        tenants = Tenant.all
        render json: tenants
    end

    def show

    end


    private

    def find_tenant
        Tenant.find_by(id: params[:id])
    end
end
