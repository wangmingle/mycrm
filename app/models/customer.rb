class Customer < ActiveRecord::Base
  attr_accessible :address, :email, :fax, :memo, :name, :phone, :status,
   :propers, :telephone, :website, :link, :zhiwu, :dh, :sj, :em, :cz, :bz

  # attr_accessor :link1, :link2, :link3, :link4, :link5, :link6, :link7

  def self.set name, value

   if value.is_a? Symbol
     define_method name do
       instance_variable_get("@#{name}") || \
       instance_variable_set("@#{name}", send(value) )
     end
   elsif value.respond_to? :call
     define_method name do
       instance_variable_get("@#{name}") || \
       instance_variable_set("@#{name}", value.call)
     end
   else
     define_method name do
       instance_variable_get("@#{name}") || \
       instance_variable_set("@#{name}", value)
     end
   end
 	end

end
