module Authlogic
  module Monkeypatches

    def self.included(base)
      base.extend ClassMethods
    end

    # MONKEYPATCH: Authlogic #persisted?
    def persisted?
      !(new_record? || destroyed?)
    end

    # MONKEYPATCH: Authlogic #to_key
    def to_key
      new_record? ? nil : [self.send(self.class.primary_key)]
    end

    # MONKEYPATCH Authlogic #save_record
    # Prevents the deprecation warning when calling save(false).  Now using :validate => false
    def save_record(alternate_record = nil)
      r = alternate_record || record
      r.save_without_session_maintenance(:validate => false) if r && r.changed? && !r.readonly?
    end


    module ClassMethods

      # MONKEYPATCH Authlogic::AuthenticatesMany::Base#authenticates_many
      # See: http://github.com/binarylogic/authlogic/issues/issue/163/#comment_389165
      def authenticates_many(name, options = {})
        options[:session_class]     ||= name.to_s.classify.constantize
        options[:relationship_name] ||= options[:session_class].klass_name.underscore.pluralize
        class_eval <<-"end_eval", __FILE__, __LINE__
          def #{name}
            relation_sql = #{options[:relationship_name]}.scoped.to_sql
            default_find_options = {:conditions => relation_sql[(relation_sql.rindex("WHERE")+5)..relation_sql.length].lstrip!}
            find_options = #{options[:find_options].inspect} || default_find_options
            find_options.delete_if { |key, value| ![:conditions, :include, :joins].include?(key.to_sym) || value.nil? }
            @#{name} ||= Authlogic::AuthenticatesMany::Association.new(#{options[:session_class]}, find_options, #{options[:scope_cookies] ? "self.class.model_name.underscore + '_' + self.send(self.class.primary_key).to_s" : "nil"})
          end
        end_eval
      end
    end

  end
end