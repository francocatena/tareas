# Para actualizar la tabla de cron de desarrollo:
# whenever --set environment=development --update-crontab tareas
# Para eliminarla
# whenever -c tareas
env :PATH, '"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'

every 1.day, at: '20:00' do
  runner 'Tarea.recordar_vencimientos'
end
