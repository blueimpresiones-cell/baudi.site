# ══════════════════════════════════════════════════════
#  FÁCIL — Dockerfile para Dokploy / VPS Hostinger
#  Sirve la app HTML estática con Nginx Alpine
#  Imagen final: ~25 MB
# ══════════════════════════════════════════════════════

FROM nginx:1.25-alpine

# Copiar configuración de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar la aplicación
COPY index.html /usr/share/nginx/html/index.html

# Permisos correctos
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

# Puerto que expone el contenedor
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD wget -qO- http://localhost/health || exit 1

CMD ["nginx", "-g", "daemon off;"]
