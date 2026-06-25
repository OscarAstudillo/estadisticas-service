# Usa una imagen liviana
FROM python:3.12-slim

# Crea usuario no root por seguridad
RUN useradd -m appuser
WORKDIR /app

# Instala dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia el código
COPY . .
RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 8006 
# (Cambia el puerto a 8005 para apuestas y 8006 para estadísticas)

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8006"]