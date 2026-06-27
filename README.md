# FÁCIL — Control de Seguridad Laboral

App web para gestión de documentación, visitas, cobros y checklist de seguridad laboral.

**Demo:** [baudi.netlify.app](https://baudi.netlify.app)

---

## Stack

- **Frontend:** HTML + CSS + JS puro (una sola página, sin framework)
- **Base de datos:** [Supabase](https://supabase.com) (PostgreSQL + Auth + RLS)
- **Deploy:** Nginx en Docker → Dokploy → VPS Hostinger

---

## Archivos del repo

```
BETA-APP/
├── index.html          ← App completa (~550 KB)
├── Dockerfile          ← Imagen Nginx Alpine
├── nginx.conf          ← Configuración del servidor
├── docker-compose.yml  ← Para Dokploy
├── .dockerignore
├── .gitignore
└── README.md
```

---

## Base de datos — Supabase

**Proyecto:** `facil-seguridad-laboral`  
**URL:** `https://tthzvtvybpbaidsrzlks.supabase.co`  
**Región:** São Paulo (sa-east-1)

### Tablas creadas
| Tabla | Descripción |
|---|---|
| `perfiles` | Datos del usuario (nombre, plan) |
| `empresas` | Empresas/obras del usuario |
| `documentos` | Documentos con fechas de vencimiento |
| `visitas` | Registro de visitas por empresa |
| `cobros` | Gestión de cobros y pagos |
| `checklist_items` | Ítems de checklist personalizables |
| `checklist_resultados` | Resultados de inspecciones |

**Row Level Security activo** — cada usuario solo ve sus propios datos.

### Resetear la DB (si Supabase se pausa)

1. Ir a [supabase.com](https://supabase.com) → tu proyecto
2. Restaurar el proyecto (botón "Restore")
3. SQL Editor → pegar el contenido de `supabase-setup.sql` → Run

---

## Deploy en Dokploy (VPS Hostinger)

### Primera vez

```bash
# 1. En el VPS — instalar Dokploy
ssh root@TU_IP
curl -sSL https://dokploy.com/install.sh | sh

# 2. Entrar al panel
# http://TU_IP:3000

# 3. Crear proyecto → Application → GitHub
#    Repo: blueimpresiones-cell/BETA-APP-
#    Branch: main
#    Build: Dockerfile
```

### Actualizar la app

```bash
# Reemplazar index.html con la nueva versión
git add index.html
git commit -m "Actualizar app"
git push origin main
# Dokploy redeploya automáticamente
```

---

## Desarrollo local

```bash
# Con Docker
docker compose up

# Sin Docker — abrir directo en el browser
open index.html
```

---

## Modo demo

Entrá sin registrarte con:
- **Email:** `demo@facilapp.ar`
- **Contraseña:** `demo1234`

Los datos del demo no se guardan en la base de datos.

---

## Configurar Supabase — deshabilitar confirmación de email

Para que los usuarios puedan entrar directo después de registrarse:

1. [supabase.com](https://supabase.com) → tu proyecto
2. **Authentication → Email** → desactivar **"Enable email confirmations"**
3. Guardar

---

## Licencia

Uso privado — todos los derechos reservados.
