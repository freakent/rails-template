    class PublicPolicy < ApplicationPolicy
      class Scope < Scope
        def resolve
           scope.all
        end
      end
    
      def show?
        # user.superuser?
        true
      end
  
      def create?
        # user.superuser?
        true
      end
  
      def new?
        create?
      end
  
      def update?
        # user.superuser?
        true
      end
  
      def edit?
        update?
      end
  
      def destroy?
        # user.superuser?
        true
      end

    end

    