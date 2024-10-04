class Tweet < ApplicationRecord
    validates :description, presence: true, length: { maximum: 280 }
    validates :user_name, presence: true
    # Ocultar los registros que tienen un timestamp en `deleted_at`
    default_scope { where(deleted_at: nil) }
    
    # Marca un tweet como eliminado
    def soft_delete
      update(deleted_at: Time.current)
    end
  
    # Verifica si un tweet está eliminado
    def deleted?
      deleted_at.present?
    end
  
    # Método alternativo para recuperar los eliminados (si necesitas).
    def self.with_deleted
      unscoped
    end
  
    # Método alternativo para solo los eliminados.
    def self.only_deleted
      unscoped.where.not(deleted_at: nil)
    end
  end
