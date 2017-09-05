# GADUDA_ver01

하이요
신박한조


src -> main -> webapp -> WEB-INF -> root-context
oracle 빈객체의 주소 설정, mongo 빈객체의 주소 설정


docBase 경로대로 폴더 생성해놓을 것
server.xml의 <host></host> 안에 추가할context
<Context path="/roomimage" reloadable="true" docBase="d:\gaduda\room">       <PreResources className="org.apache.catalina.webresources.DirResourceSet"         webAppMount="/roomimage" base="d:\gaduda\room"/>      </Context>      <Context path="/profileimage" reloadable="true" docBase="d:\gaduda\profile">       <PreResources className="org.apache.catalina.webresources.DirResourceSet"         webAppMount="/profileimage" base="d:\gaduda\profile"/>      </Context>      <Context path="/furarrimage" reloadable="true" docBase="d:\gaduda\furniturearr">       <PreResources className="org.apache.catalina.webresources.DirResourceSet"         webAppMount="/furarrimage" base="d:\gaduda\furniturearr"/>      </Context>


