*** Settings ***
Library   pylib.SchoolClassLib


*** Test Cases ***
添加班级1 - tc000001
     ${ret1}=  add school class  1   1班    60
     log   ${ret1}
     should be true    $ret1['retcode']==0

#列出班级检验一下
     ${ret2}=  list school class  1
     log   ${ret2}
     ${fc}=    evaluate   $ret2['retlist'][0]
     log  ${fc}
      should be true    $fc['id']==$ret1['id']
      should be true    $fc['invitecode']==$ret1['invitecode']
      should be true    $fc['grade__name']=='七年级'
      should be true    $fc['studentlimit']==60
      should be true    $fc['name']=='1班'


      [Teardown]   delete school class  &{ret1}[id]

