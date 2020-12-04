  $action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument " -file `"{$SCRIPTPATH}`""
  $trigger = New-ScheduledTaskTrigger -AtStartup
  
  $params = @{
    Action  = $action
    Trigger = $trigger
    TaskName = {TASKNAME}
    User = {USERNAME}
    Password = {PASSWORD}
}
  
  if(Get-ScheduledTask -TaskName $params.TaskName -EA SilentlyContinue) { 
      Set-ScheduledTask @params
      }
  else {
      Register-ScheduledTask @params
  }
